#!/bin/bash

update() {
    space="$(echo "$INFO" | jq -r '.space')"
    apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

    icon_strip=" "
    if [ "${apps}" != "" ]; then
        while read -r app; do
            icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
        done <<<"${apps}"
    else
        icon_strip=""
    fi

    sketchybar --animate sin 10 --set space.$space label="$icon_strip"
}

case "$SENDER" in
*)
    update
    ;;
esac
