#!/bin/bash

TARGET="$HOME/Library/Rime/"

echo "Installing Rime configuration to $TARGET"

if [ ! -d "$TARGET" ]; then
    echo "Error: $TARGET does not exist."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "custom_phrase.txt" ]; then
    echo -e "Creating 'custom_phrase.txt'\n"
    touch "$SCRIPT_DIR/custom_phrase.txt"
    echo "Bonjour	hello" >"$SCRIPT_DIR/custom_phrase.txt"
fi

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
    echo -e "Linked $filename -> $dest\n"
done

echo "Done!"
