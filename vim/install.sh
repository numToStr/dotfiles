#!/bin/bash

if command -v vim >/dev/null 2>&1; then
    MODULE="Vim"
    PLUG_FILE=~/.vim/autoload/plug.vim

    if [ ! -f $PLUG_FILE ]; then
        echo "[ INSTALLING ] :: $MODULE >> vim-plug"
        curl -fLo $PLUG_FILE --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        echo "[ LINKING ] :: $MODULE >> .vimrc"
        ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.vimrc
    fi

    echo "[ UPDATING ] :: $MODULE >> Plugins"
    vim +'PlugUpdate --sync' +qa
fi

if command -v nvim >/dev/null 2>&1; then
    MODULE="NeoVim"
    PLUG_FILE=~/.local/share/nvim/site/autoload/plug.vim

    if [ ! -f $PLUG_FILE ]; then
        echo "[ INSTALLING ] :: $MODULE >> vim-plug"
        curl -fLo $PLUG_FILE --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        mkdir -p ~/.config/nvim/

        echo "[ LINKING ] :: $MODULE >> init.vim"
        ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim
    fi

    echo "[ UPDATING ] :: $MODULE >> Plugins"
	nvim +'PlugUpdate --sync' +qa
fi
