#!/usr/bin/sh

# Exit codes:
# 0 - OK, or destination exists
# 1 - Incorrect usage

if [ "$#" -ne "2" ]; then
    echo "Usage: symlink.sh from to" >&2
    exit 1
fi

SOURCE="$1"
DEST="$2"

if [ -e "$DEST" ]; then
    if [ "$(readlink "$DEST")" = "$SOURCE" ]; then
        # Already linked; ignore
        exit 0
    else
        echo "$DEST already exists; ignoring" >&2
        exit 0
    fi
fi

# Make $DEST's directory if it doesn't exist
DEST_DIR="$(dirname "$DEST")"
[ "$DEST_DIR" != "" ] && mkdir -p -- "$DEST_DIR"

# Link!
ln -s -- "$SOURCE" "$DEST"
