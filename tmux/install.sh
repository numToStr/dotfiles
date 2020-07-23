#!/bin/bash

if command -v tmux >/dev/null 2>&1; then
    MODULE='Tmux'
    TPM_DIR=~/.tmux/plugins/tpm

    echo "[ LINKING ] :: $MODULE >> .tmux.conf"
    ln -sf "$DOTFILES/tmux/tmux.dawn.conf.symlink" ~/.tmux.dawn.conf
    ln -sf "$DOTFILES/tmux/tmux.conf.symlink" ~/.tmux.conf

    if [ ! -d $TPM_DIR ]; then
        echo "[ INSTALLING ] :: $MODULE >> tpm"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

        echo "[ INSTALLING ] :: $MODULE >> Plugins"
        ~/.tmux/plugins/tpm/bin/install_plugins
    else
        echo "[ UPDATING ] :: $MODULE >> Plugins"
        ~/.tmux/plugins/tpm/bin/update_plugins all
    fi
fi
