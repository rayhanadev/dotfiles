![image](https://github.com/rayhanadev/dotfiles/assets/72509475/81f54465-35b6-4c82-bbcc-c53bbc5e95ac)

# ~/.dotfiles

Heya, these are my dotfiles for MacOS! I use Nix, nix-darwin, and home-manager to scaffold my configuration.

## Features

- Window Manager • Yabai
- Shell • Zsh
- Terminal • Warp
- Prompt • Starship
- Menu Bar • Sketchybar
- App Launcher • Raycast
- IDE • Neovim & VSCode

## Installation

First, install Nix on your system.

```sh
sh <(curl -L https://nixos.org/nix/install)
```

Secondly, bootstrap the configuration with the following command.

```sh
nix-shell --packages git --command "$(curl -fsSL https://raw.githubusercontent.com/rayhanadev/dotfiles/master/bin/bootstrap.sh)"
```

Apply the configuration with the following command.

```sh
~/.dotfiles/bin/sync.sh
```

And you are good to go! Reboot your computer :)
