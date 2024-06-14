{ pkgs, username, ... }:

{
  xdg.enable = true;

  home.packages = with pkgs; [
    # tools
    aria2
    caddy
    chromedriver
    cloudflared
    cocoapods
    cowsay
    docker
    file
    fzf
    gawk
    glow
    google-cloud-sdk
    gnupg
    gnutar
    gnused
    jq
    kompose
    mas
    nmap
    p7zip
    ripgrep
    socat
    tree
    unzip
    which
    xz
    yq-go
    zip
    zstd

    # languages
    lua5_4
    python312
    uv
    nodejs_20
    nodePackages.pnpm
    bun
    rustup
    jdk
  ];

  programs.man = {
    enable = true;
    generateCaches = true;
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "23.11";
  };

  programs.gpg.enable = true;
  # services.gpg-agent.enable = true;

  imports = [
    ./config/borders
    ./config/eza
    ./config/git
    ./config/neovim
    ./config/sketchybar
    ./config/skhd
    ./config/skim
    ./config/starship
    ./config/yabai
    ./config/zsh
  ];

  programs.home-manager.enable = true;
}
