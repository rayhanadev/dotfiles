{ pkgs, ... }: {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # window focus
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - h : yabai -m window --focus west
      alt - l : yabai -m window --focus east

      alt - s : yabai -m display --focus west
      alt - g : yabai -m display --focus east

      # modifying layout
      shift + alt - r : yabai -m space --rotate 270
      shift + alt - y : yabai -m space --mirror y-axis
      shift + alt - x : yabai -m space --mirror x-axis
      shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2; sketchybar --trigger window_focus


      # modifying window size
      shift + alt - m : yabai -m window --toggle zoom-fullscreen; sketchybar --trigger window_focus
      shift + alt - f : yabai -m window --toggle zoom-parent; sketchybar --trigger window_focus

      shift + alt - e : yabai -m space --balance

      # swap windows
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - h : yabai -m window --swap west
      shift + alt - l : yabai -m window --swap east

      # move window and split
      ctrl + alt - j : yabai -m window --warp south
      ctrl + alt - k : yabai -m window --warp north
      ctrl + alt - h : yabai -m window --warp west
      ctrl + alt - l : yabai -m window --warp east

      # move window to display
      shift + alt - s : yabai -m window --display west; yabai -m display --focus west;
      shift + alt - g : yabai -m window --display east; yabai -m display --focus east;

      # move window to space
      shift + alt - p : yabai -m window --space prev;
      shift + alt - n : yabai -m window --space next;

      # move window to space #
      shift + alt - 1 : yabai -m window --space 1 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 1;
      shift + alt - 2 : yabai -m window --space 2 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 2;
      shift + alt - 3 : yabai -m window --space 3 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 3;
      shift + alt - 4 : yabai -m window --space 4 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 4;
      shift + alt - 5 : yabai -m window --space 5 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 5;
      shift + alt - 6 : yabai -m window --space 6 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 6;
      shift + alt - 7 : yabai -m window --space 7 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 7;
      shift + alt - 8 : yabai -m window --space 8 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 8;
      shift + alt - 9 : yabai -m window --space 9 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 9;
      shift + alt - 0 : yabai -m window --space 0 && sketchybar --trigger windows_on_spaces; yabai -m space --focus 0;

      # create/delete spaces
      alt - 0x21 : yabai -m space --destroy && sketchybar --trigger space_change
      alt - 0x1E : yabai -m space --create && sketchybar --trigger space_change && yabai -m space --focus last
      shift + alt - 0x21 : yabai -m space --destroy && yabai -m window --space last && sketchybar --trigger window_on_spaces --trigger space_change && yabai -m space --focus last
      shift + alt - 0x1E : yabai -m space --create && yabai -m window --space last && sketchybar --trigger window_on_spaces --trigger space_change && yabai -m space --focus last

      # start/stop yabai
      ctrl + alt - q : yabai --stop-service
      ctrl + alt - s : yabai --start-service
    '';
  };
}