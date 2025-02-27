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
      "bufbuild/buf"
      "FelixKratz/formulae"
      "homebrew/cask-fonts"
      "homebrew/services"
      "koekeishiya/formulae"
      "oven-sh/bun"
    ];

    brews = [
      {
        name = "borders";
        start_service = true;
      }
      "buf"
      "bun"
      "colima"
      "curl"
      "docker"
      "docker-buildx"
      "docker-credential-helper"
      "helm"
      "libtool"
      "mas"
      "openssh"
      "pinentry-mac"
      "python-tk"
      "qemu"
      "sketchybar"
      "skhd"
      "spicetify-cli"
      "uv"
      "wget"
      "yabai"
    ];

    casks = [
      "arc"
      "bitwarden"
      "boop"
      # "cloudflare-warp" # errors out for some reason
      "cursor"
      "dbeaver-community"
      "dbvisualizer"
      "discord"
      "docker"
      "fastclicker"
      "figma"
      "firefox"
      # "font-sketchybar-app-font"
      "google-chrome"
      "grammarly-desktop"
      "insomnia"
      "jellyfin-media-player"
      "keybase"
      "kicad"
      "lens"
      "loom"
      "lunar"
      "macfuse"
      "microsoft-teams"
      "minecraft"
      "mitmproxy"
      "notion"
      "notion-calendar"
      "obsidian"
      "ollama"
      "openvpn-connect"
      "prismlauncher"
      "protonvpn"
      "qbittorrent"
      "raspberry-pi-imager"
      "raycast"
      "sf-symbols"
      "slack"
      "spotify"
      "steam"
      "tailscale"
      "thonny"
      "tor-browser"
      "visual-studio-code"
      "vlc"
      "vmware-fusion"
      "warp"
      "webex"
      "zed@preview"
      "zoom"
    ];
  };
}
