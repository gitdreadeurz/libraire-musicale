#!/usr/bin/env bash

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

OUTPUT="$ROOT/arborescence-musicale.txt"

print_tree() {
    local dir="$1"
    local prefix="$2"
    local is_root="$3"

    local entries=()
    for entry in "$dir"/*; do
        [ -e "$entry" ] || continue
        base=$(basename "$entry")

        # Exclusions
        [ "$base" = "scripts" ] && continue

        # À la racine : ignorer les fichiers
        [ "$is_root" = "true" ] && [ -f "$entry" ] && continue

        entries+=("$entry")
    done

    local count=${#entries[@]}
    local i=0

    for path in $(printf "%s\n" "${entries[@]}" | sort); do
        i=$((i + 1))
        name=$(basename "$path")

        connector="├──"
        new_prefix="│   "
        [ "$i" -eq "$count" ] && connector="└──" && new_prefix="    "

        echo "${prefix}${connector} ${name}"

        [ -d "$path" ] && print_tree "$path" "${prefix}${new_prefix}" "false"
    done
}

{
    echo "$(basename "$ROOT")/"
    print_tree "$ROOT" "" "true"
} > "$OUTPUT"

echo "Arborescence exportée dans : $OUTPUT"
