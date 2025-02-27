{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"

      export GPG_TTY=$(tty)
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent

      export HOMEBREW_NO_ANALYTICS=1
    '';
    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval $(thefuck --alias)
      eval "$(zoxide init zsh --cmd cd)"
    '';
  };

  home.shellAliases = {
  };
}
