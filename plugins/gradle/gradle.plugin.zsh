# Looks for a gradlew file in the current working directory
# or any of its parent directories, and executes it if found.
# Otherwise it will call gradle directly.
function gradle-or-gradlew() {
	# find project root
	# taken from HTTPS://GitHub.Com/gradle/gradle-completion
	local dir="$PWD" project_root="$PWD"
	while [[ "$dir" != / ]]; do
		if [[ -x "$dir/gradlew" ]]; then
			project_root="$dir"
			break
		fi
		dir="${dir:h}"
	done

	# if gradlew found, run it instead of gradle
	if [[ -f "$project_root/gradlew" ]]; then
		echo "executing gradlew instead of gradle"
		"$project_root/gradlew" "$@"
	else
		command gradle "$@"
	fi
}

alias gradle=gradle-or-gradlew
compdef _gradle gradle-or-gradlew
