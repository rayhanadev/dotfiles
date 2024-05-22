#!/usr/bin/env sh

set -euf
SCRIPT_PATH="$(dirname "$0")"

. "$SCRIPT_PATH"/util.sh

DEBUG=${DEBUG:-0}
DISABLE_CACHE=${DISABLE_CACHE:-0}

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME"/.config} # Set if absent.

sync_flake() {
    info "Syncing Host '$HOST_TARGET'.."
    extra_args=""
    
    if [ "$DEBUG" -ne 0 ]; then
        info "Enabling debug..."
        extra_args="--show-trace"
    fi

    nix build ".#darwinConfigurations.$HOST_TARGET.system" $extra_args
    ./result/sw/bin/darwin-rebuild switch --flake ".#$HOST_TARGET"
}

sync_flake
