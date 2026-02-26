#!/usr/bin/env bash
# Usage: resize.sh grow|shrink
# Resizes the focused window along its split axis by 50px.

set -euo pipefail

STEP=50
DIRECTION="${1:?Usage: resize.sh grow|shrink}"

window_info=$(yabai -m query --windows --window)
split_type=$(echo "$window_info" | jq -r '.["split-type"]')

case "$split_type" in
  vertical)
    # windows are side by side — resize horizontally
    if [ "$DIRECTION" = "grow" ]; then
      yabai -m window --resize right:${STEP}:0 2>/dev/null \
        || yabai -m window --resize left:-${STEP}:0 2>/dev/null \
        || true
    else
      yabai -m window --resize right:-${STEP}:0 2>/dev/null \
        || yabai -m window --resize left:${STEP}:0 2>/dev/null \
        || true
    fi
    ;;
  horizontal)
    # windows are stacked top/bottom — resize vertically
    if [ "$DIRECTION" = "grow" ]; then
      yabai -m window --resize bottom:0:${STEP} 2>/dev/null \
        || yabai -m window --resize top:0:-${STEP} 2>/dev/null \
        || true
    else
      yabai -m window --resize bottom:0:-${STEP} 2>/dev/null \
        || yabai -m window --resize top:0:${STEP} 2>/dev/null \
        || true
    fi
    ;;
  *)
    # no split (single window) — try both axes
    if [ "$DIRECTION" = "grow" ]; then
      yabai -m window --resize right:${STEP}:0 2>/dev/null || true
      yabai -m window --resize bottom:0:${STEP} 2>/dev/null || true
    else
      yabai -m window --resize right:-${STEP}:0 2>/dev/null || true
      yabai -m window --resize bottom:0:-${STEP} 2>/dev/null || true
    fi
    ;;
esac
