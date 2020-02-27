#!/bin/bash

echo "You should install 'tmux' through distro's package manager"

if command -v tmux >/dev/null 2>&1; then
    echo "::[ Linking ] 'tmux.conf'"
    # touch ~/.tmux.conf
    ln -sf "$DOTFILES/tmux/tmux.conf" ~/.tmux.conf
fi
