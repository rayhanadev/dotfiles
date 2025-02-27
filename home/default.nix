{ pkgs, username, ... }:

{
  xdg.enable = true;

  home.packages = with pkgs; [
    # tools
    ansible
    aria2
    arkade
    autoconf
    automake
    btop
    caddy
    cairo
    cloudflared
    cmake
    cocoapods
    cowsay
    fastfetch
    ffmpeg
    file
    flyctl
    fzf
    gawk
    gcc-arm-embedded
    gh
    git-crypt
    git-filter-repo
    glow
    gnupg
    gnutar
    gnused
    google-cloud-sdk
    grpcurl
    ibmcloud-cli
    jq
    kaggle
    kompose
    kubectl
    kubectx
    kustomize
    libsodium
    mas
    nmap
    p7zip
    pango
    pixman
    pkg-config
    postgresql
    protobuf
    pyenv
    ripgrep
    socat
    sox
    terraform
    thefuck
    tree
    turso-cli
    unzip
    which
    xz
    yq-go
    yubikey-manager
    zip
    zstd
    zoxide

    # languages
    lua5_4
    python312
    nodejs_22
    nodePackages.pnpm
    nodePackages.yarn
    nodePackages.eslint
    nodePackages.ts-node
    firebase-tools
    # bun
    rustup
    jdk
    go
    ghc
    stack
  ];

  home.file.".jdks/jdk8".source = pkgs.jdk8;


  programs.man = {
    enable = true;
    generateCaches = true;
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
  };

  programs.gpg.enable = true;
  # services.gpg-agent.enable = true;

  imports = [
    ./config/borders
    ./config/eza
    ./config/fastfetch
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
