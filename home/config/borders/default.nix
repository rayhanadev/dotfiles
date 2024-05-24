{ ... }: {
  xdg.configFile = {
    "borders/bordersrc" = {
      source = ./config/bordersrc;
      executable = true;
    };
  };
}