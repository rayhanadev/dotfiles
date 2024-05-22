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
      "homebrew/cask-fonts"
      "homebrew/services"
    ];

    brews = [
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
      "protonvpn"
      "raycast"
      "sf-symbols"
      "slack"
      "visual-studio-code"
      "warp"
    ];
  };
}