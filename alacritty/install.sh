#!/bin/bash

if command -v alacritty >/dev/null 2>&1; then
    MODULE='Alacritty'

    echo "[ LINKING ] :: $MODULE >> .alacritty.yml"
    ln -sf "$DOTFILES/alacritty/.alacritty.yml.symlink" ~/.alacritty.yml
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
