#!/usr/bin/zsh

# Set directory of actual zsh configs
export ZDOTDIR="$HOME/.config/zsh"

# Firefox should be waylanded (also works on X11)
export MOZ_ENABLE_WAYLAND=1

# -- XDG Directory Specifications -- #
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# -- My custom file hierarchy -- #
export MEDIA_DIR="$HOME/media"
export MEDIA_IMG_DIR="$HOME/media/img"
export MEDIA_VID_DIR="$HOME/media/vid"
export MEDIA_MUSIC_DIR="$HOME/media/music"
export WALLPAPERS_DIR="$HOME/media/wallpapers"

# -- Some apps won't open links in a browser without this (and without Display Manager) -- #
export DBUS_SESSION_BUS_ADDRESS="autolaunch:"

# -- Basic software -- #
export EDITOR="nvim"
export VISUAL="$EDITOR" # For compatibility
export TERMINAL="st"
export TERM="xterm-256color"

# -- No analytics -- #
export HOMEBREW_NO_ANALYTICS=1

# -- Define MANPATH -- #
export MANPATH="$HOME/.local/share/man:/usr/local/man:/usr/local/share/man:/usr/share/man"

# -- Define PATH -- #
export PATH=$HOME/Applications:$XDG_DATA_HOME/go/bin:$HOME/.cargo/bin:$HOME/.ghcup/bin:$HOME/.local/bin:$HOME/.local/bin/scripts:/usr/local/bin:$PATH

# -- Fix softwares that do not adhere to XDG -- #
export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="-"
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export WINEPREFIX="$XDG_DATA_HOME"/wine
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export STACK_ROOT="$XDG_DATA_HOME"/stack

# -- Homebrew -- #
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
