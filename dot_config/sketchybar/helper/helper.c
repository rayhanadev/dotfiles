#include "cpu.h"
#include "sketchybar.h"

static struct cpu g_cpu;

static void handler(env env) {
    char *name = env_get_value_for_key(env, "NAME");

    if (strcmp(name, "cpu.percent") == 0) {
        cpu_update(&g_cpu);
        if (g_cpu.command[0] != '\0')
            sketchybar(g_cpu.command);
    }
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: helper \"<bootstrap name>\"\n");
        return 1;
    }

    cpu_init(&g_cpu);
    event_server_begin(handler, argv[1]);
    return 0;
}
