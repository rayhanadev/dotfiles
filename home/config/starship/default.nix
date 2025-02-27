{ ... }: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };

      aws = {
        symbol = "🅰 ";
      };

      gcloud = {
        format = "on [$symbol$active(\($region\))]($style) ";
        symbol = "🅶 ️";
      };

      format = "$username$directory$git_branch$git_status$fill$c$elixir$elm$golang$haskell$java$julia$nodejs$nim$rust$scala$conda$python$time\n[󱞪](fg:base0F) ";

      palette = "base16";

      palettes.base16 = {
        base00 = "#101010"; # Background
        base01 = "#252525"; # Lighter background
        base02 = "#464646"; # Selection background
        base03 = "#525252"; # Comments, Invisibles
        base04 = "#686868"; # Dark Foreground
        base05 = "#b9b9b9"; # Default Foreground
        base06 = "#e3e3e3"; # Light Foreground
        base07 = "#f7f7f7"; # Light Background
        base08 = "#7c7c7c"; # Variables, XML Tags
        base09 = "#999999"; # Integers, Boolean, Constants
        base0A = "#a0a0a0"; # Classes, Markup Bold
        base0B = "#8e8e8e"; # Strings, Inherited class
        base0C = "#868686"; # Support, Regex
        base0D = "#686868"; # Functions, Methods
        base0E = "#747474"; # Keywords
        base0F = "#5e5e5e"; # Deprecated, Errors
      };

      directory = {
        format = "[](fg:base01)[ $path ]($style)[](fg:base01) ";
        style = "bg:base01 fg:base09";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Documents = "󰈙";
          Downloads = " ";
          Music = " ";
          Pictures = " ";
        };
      };

      fill = {
        style = "fg:base01";
        symbol = " ";
      };

      git_branch = {
        format = "[](fg:base01)[ $symbol $branch ]($style)[](fg:base01) ";
        style = "bg:base01 fg:base09";
        symbol = "";
      };

      git_status = {
        disabled = false;
        style = "bg:base01 fg:base08";
        format = "[](fg:base01)([$all_status$ahead_behind]($style))[](fg:base01) ";
        up_to_date = "[ ✓ ](bg:base01 fg:base0F)";
        untracked = "[?\($count\)](bg:base01 fg:base09)";
        stashed = "[\$](bg:base01 fg:base0F)";
        modified = "[!\($count\)](bg:base01 fg:base09)";
        renamed = "[»\($count\)](bg:base01 fg:base0F)";
        deleted = "[✘\($count\)](style)";
        staged = "[++\($count\)](bg:base01 fg:base09)";
        ahead = "[⇡\($count\)](bg:base01 fg:base0C)";
        diverged = "⇕[\[](bg:base01 fg:base0F)[⇡\($ahead_count\)](bg:base01 fg:base0C)[⇣\($behind_count\)](bg:base01 fg:base0A)[\]](bg:base01 fg:base0F)";
        behind = "[⇣\($count\)](bg:base01 fg:base0A)";
      };

      time = {
        disabled = false;
        format = " [](fg:base01)[ $time 󰴈 ]($style)[](fg:base01)";
        style = "bg:base01 fg:base09";
        time_format = "%I:%M%P";
        use_12hr = true;
      };

      username = {
        disabled = false;
        format = "[](fg:base01)[󰧱 $user]($style)[](fg:base01) ";
        show_always = true;
        style_root = "bg:base01 fg:base09";
        style_user = "bg:base01 fg:base09";
      };

      # Languages
      c = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      elixir = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      elm = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      golang = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      haskell = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      java = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      julia = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      nodejs = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = "󰎙 ";
      };

      nim = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = "󰆥 ";
      };

      rust = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      scala = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      python = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$version]($style)[](fg:base01) ";
        disabled = false;
        symbol = " ";
      };

      conda = {
        style = "bg:base01 fg:base09";
        format = " [](fg:base01)[$symbol$environment]($style)[](fg:base01) ";
        disabled = false;
        symbol = "🅒 ";
      };
    };
  };
}
