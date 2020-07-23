#!/bin/bash

if command -v konsole >/dev/null 2>&1; then
    MODULE='Konsole'

    echo "[ LINKING ] :: $MODULE >> nord.colorscheme"
    ln -sf "$DOTFILES/konsole/node.colorscheme.symlink" ~/.local/share/konsole/nord.colorscheme
fi
