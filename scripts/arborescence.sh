DIR="${1:-$(dirname "$0")/..}"
DIR=$(cd "$DIR" && pwd) 

BLUE="\033[34m"
GREEN="\033[32m"
RESET="\033[0m"

print_tree() {
    local dir="$1"
    local prefix="$2"

    [ ! -d "$dir" ] && return

    local entries=()
    for entry in  "$dir"/*; do
        [ -e "$entry" ] || continue
        base=$(basename "$entry")
        [[ "$base" == "." || "$base" == ".." ]] && continue
        entries+=("$entry")
    done

    local dirs=()
    local files=()
    for e in "${entries[@]}"; do
        [ -d "$e" ] && dirs+=("$e") || files+=("$e")
    done
    IFS=$'\n' sorted=($(printf "%s\n" "${dirs[@]}" | sort) $(printf "%s\n" "${files[@]}" | sort))
    unset IFS

    local count=${#sorted[@]}
    local i=0

    for path in "${sorted[@]}"; do
        i=$((i + 1))
        local name=$(basename "$path")
        local connector="├──"
        local new_prefix="│   "
        [ "$i" -eq "$count" ] && connector="└──" && new_prefix="    "

        local color="$RESET"
        [ -d "$path" ] && color="$BLUE"
        [ -x "$path" ] && [ ! -d "$path" ] && color="$GREEN"

        echo -e "${prefix}${connector} ${color}${name}${RESET}"

        [ -d "$path" ] && print_tree "$path" "${prefix}${new_prefix}"
    done
}

echo -e "${BLUE}$(basename "$DIR")${RESET}/"
print_tree "$DIR" ""
