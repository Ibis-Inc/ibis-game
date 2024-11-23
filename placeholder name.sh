#!/bin/sh
echo -ne '\033c\033]0;placeholder name\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/placeholder name.x86_64" "$@"
