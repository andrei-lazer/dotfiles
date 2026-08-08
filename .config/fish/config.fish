if status is-interactive

    fish_add_path ~/.local/bin
    fish_add_path ~/.local/scripts
    fish_add_path ~/.cargo/bin/
    fish_add_path ~/.local/share/bob/nvim-bin
    fish_add_path ~/.local/scripts
    fish_add_path ~/.opencode/bin

    # environment variables
    set -x XDG_CONFIG_HOME "$HOME/.config"
    set -x XDG_DATA_HOME "$HOME/.local/share"
    set -x XDG_CACHE_HOME "$HOME/.cache"
    set -x XDG_STATE_HOME "$HOME/.local/state"

    set -x --unpath NOTE_PATH ~/wiki/TODO.md

    # cat $NOTE_PATH
    zoxide init --cmd cd fish | source

    # prints empty tickboxes in the notes file
    print_todo

    # aliases
    abbr -a ls ls --color
    abbr -a c clear
    abbr -a tn tmux new-session -s
    abbr -a tl tmux list-session
    abbr -a ta tmux attach-session
    abbr -a td tmux-delete
    abbr -a clipboard xclip -selection clipboard

    set -U fish_greeting # turn off fish greeting
end

