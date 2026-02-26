#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mach/mach.h>
#include <stdbool.h>
#include <sys/sysctl.h>
#include <libproc.h>
#include <time.h>

#define MAX_TOPPROC_LEN 28

static const char FILTER_PATTERN[] = "com.apple.";

struct proc_cpu_sample {
    pid_t pid;
    uint64_t cpu_time;
};

struct cpu {
    host_t host;
    mach_msg_type_number_t count;
    host_cpu_load_info_data_t load;
    host_cpu_load_info_data_t prev_load;
    bool has_prev_load;

    char color_red[16];
    char color_orange[16];
    char color_yellow[16];
    char color_default[16];

    char command[256];

    struct proc_cpu_sample *prev_samples;
    int prev_sample_count;
    uint64_t prev_sample_time;
};

static inline void cpu_init(struct cpu *cpu) {
    cpu->host = mach_host_self();
    cpu->count = HOST_CPU_LOAD_INFO_COUNT;
    cpu->has_prev_load = false;
    cpu->command[0] = '\0';
    cpu->prev_samples = NULL;
    cpu->prev_sample_count = 0;
    cpu->prev_sample_time = 0;

    const char *red = getenv("RED");
    const char *orange = getenv("ORANGE");
    const char *yellow = getenv("YELLOW");
    const char *label = getenv("LABEL_COLOR");

    snprintf(cpu->color_red, sizeof(cpu->color_red), "%s",
             red ? red : "0xffff0000");
    snprintf(cpu->color_orange, sizeof(cpu->color_orange), "%s",
             orange ? orange : "0xffff8800");
    snprintf(cpu->color_yellow, sizeof(cpu->color_yellow), "%s",
             yellow ? yellow : "0xffffff00");
    snprintf(cpu->color_default, sizeof(cpu->color_default), "%s",
             label ? label : "0xffb9b9b9");
}

static inline void cpu_get_topproc(struct cpu *state, char *topproc) {
    topproc[0] = '\0';

    // Get process list via sysctl
    int mib[4] = { CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0 };
    size_t size = 0;
    if (sysctl(mib, 4, NULL, &size, NULL, 0) < 0) return;

    size += size / 10;
    struct kinfo_proc *procs = (struct kinfo_proc *)malloc(size);
    if (!procs) return;

    if (sysctl(mib, 4, procs, &size, NULL, 0) < 0) {
        free(procs);
        return;
    }

    int nprocs = (int)(size / sizeof(struct kinfo_proc));

    // Get CPU times for each process via proc_pidinfo
    struct proc_cpu_sample *samples = (struct proc_cpu_sample *)malloc(
        nprocs * sizeof(struct proc_cpu_sample));
    if (!samples) { free(procs); return; }

    int sample_count = 0;
    for (int i = 0; i < nprocs; i++) {
        pid_t pid = procs[i].kp_proc.p_pid;
        struct proc_taskinfo taskinfo;
        int ret = proc_pidinfo(pid, PROC_PIDTASKINFO, 0,
                               &taskinfo, sizeof(taskinfo));
        if (ret == (int)sizeof(taskinfo)) {
            samples[sample_count].pid = pid;
            samples[sample_count].cpu_time = taskinfo.pti_total_user
                                           + taskinfo.pti_total_system;
            sample_count++;
        }
    }
    free(procs);

    // Compute deltas against previous snapshot
    uint64_t now = clock_gettime_nsec_np(CLOCK_MONOTONIC_RAW);
    uint64_t elapsed_ns = (state->prev_sample_time > 0)
                        ? now - state->prev_sample_time : 0;
    pid_t top_pid = 0;
    uint64_t top_delta = 0;

    if (state->prev_samples && elapsed_ns > 0) {
        for (int i = 0; i < sample_count; i++) {
            for (int j = 0; j < state->prev_sample_count; j++) {
                if (state->prev_samples[j].pid == samples[i].pid) {
                    if (samples[i].cpu_time
                        > state->prev_samples[j].cpu_time) {
                        uint64_t delta = samples[i].cpu_time
                                       - state->prev_samples[j].cpu_time;
                        if (delta > top_delta) {
                            top_delta = delta;
                            top_pid = samples[i].pid;
                        }
                    }
                    break;
                }
            }
        }
    }

    // Store current snapshot for next call
    free(state->prev_samples);
    state->prev_samples = samples;
    state->prev_sample_count = sample_count;
    state->prev_sample_time = now;

    if (top_pid == 0) return;

    char name[256];
    if (proc_name(top_pid, name, sizeof(name)) <= 0)
        snprintf(name, sizeof(name), "unknown");

    // Strip "com.apple." prefix if present
    char *start = name;
    char *filter = strstr(name, FILTER_PATTERN);
    if (filter == name)
        start = name + sizeof(FILTER_PATTERN) - 1;

    // Truncate to fit label
    size_t len = strlen(start);
    if (len <= MAX_TOPPROC_LEN) {
        memcpy(topproc, start, len + 1);
    } else {
        memcpy(topproc, start, MAX_TOPPROC_LEN);
        topproc[MAX_TOPPROC_LEN]     = '.';
        topproc[MAX_TOPPROC_LEN + 1] = '.';
        topproc[MAX_TOPPROC_LEN + 2] = '.';
        topproc[MAX_TOPPROC_LEN + 3] = '\0';
    }
}

static inline void cpu_update(struct cpu *cpu) {
    cpu->count = HOST_CPU_LOAD_INFO_COUNT;
    kern_return_t error = host_statistics(cpu->host,
                                          HOST_CPU_LOAD_INFO,
                                          (host_info_t)&cpu->load,
                                          &cpu->count);

    if (error != KERN_SUCCESS) {
        fprintf(stderr, "Error: Could not read cpu host statistics.\n");
        return;
    }

    if (!cpu->has_prev_load) {
        cpu->command[0] = '\0';
        cpu->prev_load = cpu->load;
        cpu->has_prev_load = true;
        // Prime the process snapshot so deltas are ready next call
        char topproc[MAX_TOPPROC_LEN + 4];
        cpu_get_topproc(cpu, topproc);
        return;
    }

    uint32_t delta_user = cpu->load.cpu_ticks[CPU_STATE_USER]
                        - cpu->prev_load.cpu_ticks[CPU_STATE_USER];
    uint32_t delta_system = cpu->load.cpu_ticks[CPU_STATE_SYSTEM]
                          - cpu->prev_load.cpu_ticks[CPU_STATE_SYSTEM];
    uint32_t delta_idle = cpu->load.cpu_ticks[CPU_STATE_IDLE]
                        - cpu->prev_load.cpu_ticks[CPU_STATE_IDLE];

    uint32_t total = delta_user + delta_system + delta_idle;
    cpu->prev_load = cpu->load;

    if (total == 0) {
        cpu->command[0] = '\0';
        return;
    }

    double user_perc = (double)delta_user / (double)total;
    double sys_perc = (double)delta_system / (double)total;
    double total_perc = user_perc + sys_perc;

    char topproc[MAX_TOPPROC_LEN + 4];
    cpu_get_topproc(cpu, topproc);

    const char *color;
    if (total_perc >= .7)
        color = cpu->color_red;
    else if (total_perc >= .3)
        color = cpu->color_orange;
    else if (total_perc >= .1)
        color = cpu->color_yellow;
    else
        color = cpu->color_default;

    snprintf(cpu->command, sizeof(cpu->command),
             "--push cpu.sys %.2f "
             "--push cpu.user %.2f "
             "--set cpu.top label='%s' "
             "--set cpu.percent label=%.0f%% label.color=%s",
             sys_perc, user_perc, topproc,
             total_perc * 100., color);
}
