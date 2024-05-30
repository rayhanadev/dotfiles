{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    masApps = {
      # "Parallels Desktop" = 1085114709;
    };

    taps = [
      "FelixKratz/formulae"
      "homebrew/cask-fonts"
      "homebrew/services"
    ];

    brews = [
      {
        name = "borders";
        start_service = true;
      }
      "curl"
      "mas"
      "openssh"
      "pinentry-mac"
      "wget"
    ];

    casks = [
      "arc"
      "bitwarden"
      "boop"
      "discord"
      "insomnia"
      "jellyfin-media-player"
      "protonvpn"
      "qbittorrent"
      "raspberry-pi-imager"
      "raycast"
      "sf-symbols"
      "slack"
      "steam"
      "visual-studio-code"
      "vlc"
      "warp"
      "zoom"
    ];
  };
}