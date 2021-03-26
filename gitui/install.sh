#!/bin/bash

MODULE='gitui'

echo "[ LINKING ] :: $MODULE >> {theme,keybinds}"

ln -sf "$DOTFILES/gitui/theme.ron" $HOME/.config/gitui/theme.ron
ln -sf "$DOTFILES/gitui/key_config.ron" $HOME/.config/gitui/key_config.ron
