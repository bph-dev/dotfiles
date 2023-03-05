#!/usr/local/env bash

export GOENV="$HOME/.config/go/env"

#SLINK=$(find $(which go) -type l)
#if [ ! -z "$SLINK" ];
#then
#  IFS=" " read -ra PATHS <<< "$(stat $(which go) --printf='%N'; printf '\n')"
#  go_binary="${PATHS[2]}"
#  echo "go_binary:  $go_binary"
#  unset IFS
#  GOROOT="$(echo $go_binary | tr \'\' '\n')"
#  export GOROOT=$GOROOT
#fi

GOPATH="$HOME/workspaces/go/pkg"
GOBIN="$HOME/workspaces/go/bin"
go env -w GOPATH="$GOPATH"
go env -w GOBIN="$GOBIN"

export PATH="'$GOBIN:$PATH'"
export GOSRC="$HOME/workspaces/go/src"

if [ ! -d "$GOPATH" ]; 
then
  echo "GOPATH directory '$GOPATH' does not exist - Creating directory."
  mkdir -p $GOPATH
fi

if [ ! -d "$GOBIN" ];
then
  echo "GOBIN directory '$GOBIN' does not exist - Creating directory."
  mkdir -p $GOBIN
fi

if [ ! -d "$GOSRC" ]; 
then
  echo "GOSRC directory '$GOSRC' does not exist - Creating directory."
  mkdir -p $GOSRC
fi

go env | grep -e "GOENV" -e "GOPATH" -e "GOBIN" -e "GOROOT" 
printenv | grep -e "GOSRC"

