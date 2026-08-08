function print_todo -d "Prints unticked markdown boxes from $TODO_PATH"

    printf "\n"

    if type -q mcat
        mcat $NOTE_PATH
    else
        set_color --bold cyan
        set_color --underline cyan
        printf '%s\n' TODO
        set_color normal
        awk '
          /^[[:space:]]*- \[ \]/ {
            if (gap && found) print ""
            match($0, /^[[:space:]]*/)
            indent = substr($0, RSTART, RLENGTH)
            rest = substr($0, RLENGTH + 1)
            sub(/^- \[ \][[:space:]]*/, "", rest)
            print indent "☐ " rest
            gap = 0
            found = 1
            next
          }

          /[^[:space:]]/ { gap = 1 }
        ' "$NOTE_PATH"
    end

    printf "\n"

end
