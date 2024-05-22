{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export GPG_TTY=$(tty)
      export SSH_AUTH_SOCK=\$\{HOME\}/.gnupg/S.gpg-agent.ssh
    '';
  };

  home.shellAliases = {
  };
}
