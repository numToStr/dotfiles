#!/bin/bash

echo "[ LINKING ] :: fd >> .fdignore"

ln -sf "$DOTFILES/fd/fdignore.symlink" ~/.fdignore
