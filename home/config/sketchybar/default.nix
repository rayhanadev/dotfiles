{ ... }: {
  xdg.configFile = {
    "sketchybar/helper/cpu.h".source = ./config/helper/cpu.h;
    "sketchybar/helper/helper.c".source = ./config/helper/helper.c;
    "sketchybar/helper/Makefile".source = ./config/helper/Makefile;
    "sketchybar/helper/sketchybar.h".source = ./config/helper/sketchybar.h;
    
    "sketchybar/items/apple.sh" = {
      source = ./config/items/apple.sh;
      executable = true;
    };
    "sketchybar/items/battery.sh" = {
      source = ./config/items/battery.sh;
      executable = true;
    };
    "sketchybar/items/brew.sh" = {
      source = ./config/items/brew.sh;
      executable = true;
    };
    "sketchybar/items/calendar.sh" = {
      source = ./config/items/calendar.sh;
      executable = true;
    };
    "sketchybar/items/cpu.sh" = {
      source = ./config/items/cpu.sh;
      executable = true;
    };
    "sketchybar/items/front_app.sh" = {
      source = ./config/items/front_app.sh;
      executable = true;
    };
    "sketchybar/items/spaces.sh" = {
      source = ./config/items/spaces.sh;
      executable = true;
    };
    "sketchybar/items/volume.sh" = {
      source = ./config/items/volume.sh;
      executable = true;
    };
    "sketchybar/items/yabai.sh" = {
      source = ./config/items/yabai.sh;
      executable = true;
    };

    "sketchybar/plugins/battery.sh" = {
      source = ./config/plugins/battery.sh;
      executable = true;
    };
    "sketchybar/plugins/brew.sh" = {
      source = ./config/plugins/brew.sh;
      executable = true;
    };
    "sketchybar/plugins/calendar.sh" = {
      source = ./config/plugins/calendar.sh;
      executable = true;
    };
    "sketchybar/plugins/icon_map.sh" = {
      source = ./config/plugins/icon_map.sh;
      executable = true;
    };
    "sketchybar/plugins/space.sh" = {
      source = ./config/plugins/space.sh;
      executable = true;
    };
    "sketchybar/plugins/volume_click.sh" = {
      source = ./config/plugins/volume_click.sh;
      executable = true;
    };
    "sketchybar/plugins/volume.sh" = {
      source = ./config/plugins/volume.sh;
      executable = true;
    };
    "sketchybar/plugins/yabai.sh" = {
      source = ./config/plugins/yabai.sh;
      executable = true;
    };
    "sketchybar/plugins/zen.sh" = {
      source = ./config/plugins/zen.sh;
      executable = true;
    };

    "sketchybar/colors.sh" = {
      source = ./config/colors.sh;
      executable = true;
    };
    "sketchybar/icons.sh" = {
      source = ./config/icons.sh;
      executable = true;
    };
    "sketchybar/sketchybarrc" = {
      source = ./config/sketchybarrc;
      executable = true;
    };
  };
}