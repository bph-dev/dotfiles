#!/usr/bin/env bash

set -e -E

if [ "$#" -ne "1" ]; then
	echo "Usage: install.sh \$HOME" >&2
	exit 1
fi 

THERE="$(cd "$HOME" && pwd)"
OUT="$1"

cd "$THERE"

local_projects=(
	bash
	tmux
	vim
)

echo "Symlinking files.."
SYM="$THERE/dotfiles/symlink.sh"
for project in "${local_projects[@]}"; do 
	echo "($project)"
	THERE_PROJ="$THERE/dotfiles/$project"
	. "$THERE_PROJ/install.sh"
done

