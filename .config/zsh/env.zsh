# path modifications
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export MANPAGER="nvim +Man!"

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/scripts/
export PATH=$PATH:~/.local/share/bob/nvim-bin
export PATH=$PATH:~/.cargo/bin/

# python venv shortcuts
source ~/.local/scripts/venv_wrapper.zsh
