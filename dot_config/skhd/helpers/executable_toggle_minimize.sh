#!/usr/bin/env bash
# Toggle minimize: if minimized windows exist on the current space,
# restore the most recent one. Otherwise, minimize the focused window.

set -euo pipefail

minimized_id=$(
  yabai -m query --windows --space \
    | jq '[.[] | select(.["is-minimized"] == true)] | last | .id // empty'
)

if [ -n "$minimized_id" ] && [ "$minimized_id" != "null" ]; then
  yabai -m window --deminimize "$minimized_id"
  yabai -m window --focus "$minimized_id"
else
  yabai -m window --minimize
fi
