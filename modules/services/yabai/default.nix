{ pkgs, ... }: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
  };
}