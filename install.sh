#!/usr/bin/env bash

set -e -E

if [ "$#" -ne "1" ]; then
	echo "Usage: install.sh \$HOME" >&2
	exit 1
fi 

PWD="$(cd "$HOME" && pwd)"
HOME="$1"

cd "$PWD"

local_projects=(
  lynx
  go 
  tmux
  vim
  #nvim
  bash
  #zsh 
)

echo "Symlinking files..."
SYM_LINK="$PWD/dotfiles/symlink.sh"
for proj in "${local_projects[@]}"; do 
	echo "($proj)"
	LOCAL_PROJ="$PWD/dotfiles/$proj"
	. "$LOCAL_PROJ/install.sh"
done

unset PWD proj LOCAL_PROJ local_projects HOME 

