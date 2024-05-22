{ ... }: {
  xdg.configFile = {
    "yabai/yabairc" = {
      source = ./config/yabairc;
      executable = true;
    };
  };
}