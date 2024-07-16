{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    masApps = {
      "Microsoft Excel" = 462058435;
      "Microsoft Outlook" = 985367838;
      "Microsoft PowerPoint" = 462062816;
      "Microsoft Word" = 462054704;
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
      "fastclicker"
      "google-chrome"
      "insomnia"
      "jellyfin-media-player"
      "lens"
      "macfuse"
      "minecraft"
      "notion"
      "notion-calendar"
      "prismlauncher"
      "protonvpn"
      "qbittorrent"
      "raspberry-pi-imager"
      "raycast"
      "sf-symbols"
      "slack"
      "steam"
      "tailscale"
      "visual-studio-code"
      "vlc"
      "vmware-fusion"
      "warp"
      "zoom"
    ];
  };
}