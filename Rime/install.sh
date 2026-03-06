#!/bin/bash

TARGET="$HOME/Library/Rime/"

echo "Installing Rime configuration to $TARGET"

if [ ! -d "$TARGET" ]; then
    echo "Error: $TARGET does not exist."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# link all the files and dirs to the target with `ln -s $PWD/filename $TARGET/filename`
for item in "$SCRIPT_DIR"/*; do
    filename="$(basename "$item")"

    # skip the install script itself
    if [ "$filename" = "install.sh" ]; then
        continue
    fi

    dest="$TARGET$filename"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Removing existing $dest"
        rm -rf "$dest"
    fi

    ln -s "$item" "$dest"
    echo "Linked $filename -> $dest"
done

echo "Done!"
