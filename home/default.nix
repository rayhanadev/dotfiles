{ pkgs, username, ... }:

{
  xdg.enable = true;

  home.packages = with pkgs; [
    # tools
    aria2
    caddy
    cowsay
    docker
    file
    fzf
    gawk
    glow
    gnupg
    gnutar
    gnused
    jq
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
    python3
    nodejs_20
    nodePackages.pnpm
    bun
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
