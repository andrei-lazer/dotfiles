# stolen and adapted from https://gist.github.com/dbtek/fb2ddccb18f0cf63a654ea2cc94c8f19

venv() {
	if [ $# -eq 0 ]; then
		venv_name=venv
	else
		venv_name=$1
	fi

	if [ -d "./$venv_name" ]; then
		source "./$venv_name/bin/activate"
	else
		echo "Virtual environment '$venv_name' does not exist."
	fi
}

mkvenv() {
	if [ $# -eq 0 ]; then
		venv_name=venv
	else
		venv_name=$1
	fi

	if [ -d "./$venv_name" ]; then
		echo "Virtual environment '$venv_name' already exists."
	else
		echo "Creating venv under ./$venv_name"
		python3 -m venv "./$venv_name"
		echo "Activating $venv_name"
		venv "$venv_name"
	fi
}

rmvenv() {
	if [ $# -eq 0 ]; then
		venv_name=venv
	else
		venv_name=$1
	fi

	current_venv=$(basename "${VIRTUAL_ENV:-}")
	for env in "$@"; do
		if [ -d "./$env" ]; then
			if [ "$env" = "$current_venv" ]; then
				deactivate
				echo "Deactivated current virtual environment '$env'."
			fi
			rm -rf "./$env"
			echo "Virtual environment '$env' removed."
		else
			echo "Virtual environment '$env' does not exist."
		fi
	done
}
