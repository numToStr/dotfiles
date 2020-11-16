#!/bin/bash

if command -v nvim >/dev/null 2>&1; then
    MODULE="NeoVim"
    PLUG_FILE=~/.local/share/nvim/site/autoload/plug.vim

    if [ ! -f $PLUG_FILE ]; then
        echo "[ INSTALLING ] :: $MODULE >> vim-plug"
        curl -fLo $PLUG_FILE --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        mkdir -p $HOME/.config/nvim/

        echo "[ LINKING ] :: $MODULE >> init.vim"
        ln -sf "$DOTFILES/neovim/init.vim" $HOME/.config/nvim/init.vim
    fi

    echo "[ UPDATING ] :: $MODULE >> Plugins"
	nvim +'PlugUpdate --sync' +qa
else
    echo "[ ERROR ] :: Please install `neovim`"
fi
