{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    masApps = {
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
      "raycast"
      "sf-symbols"
      "slack"
      "visual-studio-code"
      "warp"
    ];
  };
}