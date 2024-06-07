{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export GPG_TTY=$(tty)
      export SSH_AUTH_SOCK=\$\{HOME\}/.gnupg/S.gpg-agent.ssh
      export HOMEBREW_NO_ANALYTICS=1

      printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash" }}\x9c'
    '';
    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  home.shellAliases = {
  };
}
