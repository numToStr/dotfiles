#!/bin/bash

if command -v zsh >/dev/null 2>&1; then
    MODULE='Zsh'

    if [[ -f $HOME/.zinit/bin/zinit.zsh ]]; then
        echo "[ UPDATING ] :: $MODULE >> zinit"
        zinit self-update

        echo "[ UPDATING ] :: $MODULE >> Plugins"
        zinit update --all
    else
        echo "[ INSTALLING ] :: $MODULE >> zinit"

        print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
        command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
        command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
            print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
            print -P "%F{160}▓▒░ The clone has failed.%f%b"

        echo "[ LINKING ] :: $MODULE >> .zshrc"

        [[ -f $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/.zshrc.backup
        ln -sf "$DOTFILES/zinit/.zshrc.symlink" $HOME/.zshrc

        echo "[ NOTE ] :: All $MODULE plugins will be installed on first prompt."
    fi
fi
