#!/bin/bash

if command -v vim >/dev/null 2>&1; then
    echo "::[ Installing ] Vim >> 'vim-plug'"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo "::[ Linking ] Vim >> '.vimrc'"
    ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.vimrc

    # vim +'PlugInstall --sync' +qa
    vim +'PlugUpdate' +qa
fi

if command -v nvim >/dev/null 2>&1; then
    echo "::[ Installing ] Nvim >> 'vim-plug'"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.config/nvim/

    echo "::[ Linking ] Nvim >> 'init.vim'"
    ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim

    # nvim +'PlugInstall --sync' +qa
	nvim +'PlugUpdate' +qa
fi
