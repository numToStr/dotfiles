#!/bin/bash

MODULE='Starship Prompt'

echo "[ LINKING ] :: $MODULE >> starship.toml"
ln -sf "$DOTFILES/starship/starship.toml.symlink" $HOME/.config/starship.toml
