#!/bin/bash

if command -v kitty >/dev/null 2>&1; then
    MODULE='Kitty'

    echo "[ LINKING ] :: $MODULE >> kitty.conf"
    ln -sf "$DOTFILES/kitty/kitty.conf.symlink" $HOME/.config/kitty/kitty.conf
else
    echo "[ NOTFOUND ] :: $MODULE"
fi
