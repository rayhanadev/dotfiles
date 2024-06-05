{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    masApps = {
      # "Parallels Desktop" = 1085114709;
      "XCode" = 497799835;
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
      # "cloudflare-warp" # errors out for some reason
      "discord"
      "insomnia"
      "jellyfin-media-player"
      "lens"
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