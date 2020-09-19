#!/bin/bash

if command -v zsh >/dev/null 2>&1; then
    MODULE='Zsh'
    ZINIT=$HOME/.zinit/bin/zinit.zsh

    echo "[ LINKING ] :: $MODULE >> .zshrc"

    [[ -f $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/.zshrc.backup
    ln -sf "$DOTFILES/zinit/.zshrc.symlink" $HOME/.zshrc

    if [[ ! -f $ZINIT ]]; then
        echo "[ INSTALLING ] :: $MODULE >> zinit"

        command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
        command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
            echo "[ SUCCESS ] :: Installation successful" || \
            echo "[ FAIL ] :: Installation failed"

        echo "[ NOTE ] :: All $MODULE plugins will be installed on first prompt."
    else
        echo "[ Info ] :: Run 'zinit self-update && zinit update --all' to update plugins"
    fi
fi
