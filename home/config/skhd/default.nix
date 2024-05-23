{ ... }: {
  xdg.configFile = {
    "skhd/skhdrc" = {
      source = ./config/skhdrc;
      executable = true;
    };
  };
}