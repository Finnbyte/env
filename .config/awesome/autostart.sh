#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

# run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" &
run "albert"
run "connman-gtk"
run "pipewire-booter"
run "xmousepasteblock"
# run "caffeine" &
# run "feh" --randomize --recursive --bg-fill ~/Pictures/Wallpapers/ &
# run "picom" -b &
# run "cbattico
