#!/usr/bin/sh

# Exit codes:
# 0 - OK, or destination exists
# 1 - Incorrect usage

# condition: check the number of positional params by expanding them
if [ "$#" -ne "2" ]; then
    echo "Usage: symlink.sh from to" >&2
    exit 1
fi

SOURCE="$1"
DEST="$2"

# condition: check if the file/dir is present 
if [ -e "$DEST" ]; then
    if [ "$(readlink "$DEST")" = "$SOURCE" ]; then
        # Already linked; destination exists; ignore
        exit 0
    else
        echo "$DEST already exists; ignoring" >&2
        exit 0
    fi
fi

# Make $DEST's directory if it doesn't exist
DEST_DIR="$(dirname "$DEST")"
# condition: check if the destination dir is not empty, then proceed if true
[ "$DEST_DIR" != "" ] && mkdir -p -- "$DEST_DIR" 

# Link!
ln -s -- "$SOURCE" "$DEST"

unset SOURCE DEST DEST_DIR

