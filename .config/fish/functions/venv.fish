function venv -d "Activate a virtualenv (default: ./venv)"
    set -l name venv
    test (count $argv) -gt 0; and set name $argv[1]

    if test -d "./$name"
        source "./$name/bin/activate.fish"
    else
        echo "Virtual environment '$name' does not exist." >&2
        return 1
    end
end
