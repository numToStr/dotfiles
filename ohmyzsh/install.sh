#!/bin/bash

if command -v zsh >/dev/null 2>&1; then
    OMZ_DIR=$HOME/.oh-my-zsh
    OMZ_FILE=$OMZ_DIR/oh-my-zsh.sh
    MODULE='Oh-My-Zsh'

    if [[ -d "$OMZ_DIR" && -f "$OMZ_FILE" ]]; then
        echo "[ UPDATING ] :: $MODULE"
        sh $OMZ_DIR/tools/upgrade.sh
        command rm -rf $OMZ_DIR/log/update.lock
    else
        echo "[ INSTALLING ] :: $MODULE"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        echo "[ LINKING ] :: $MODULE >> .zshrc"
        mv ~/.zshrc ~/.zshrc.backup
        ln -sf "$DOTFILES/ohmyzsh/zshrc.symlink" ~/.zshrc

        # echo "::[ Installing ] Plugin >> 'zsh-syntax-highlighting'"
        # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

        echo "[ INSTALLING ] :: $MODULE >> Plugin >> fast-syntax-highlighting"
        git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

        echo "[ INSTALLING ] :: $MODULE >> Plugin >> zsh-autosuggestions"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        echo "[ INSTALLING ] :: $MODULE >> Plugin >> zsh-completions"
        git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
        # autoload -U compinit && compinit

        echo "[ INSTALLING ] :: $MODULE >> Plugin >> zsh-history-substring-search"
        git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

        echo "[ INSTALLING ] :: $MODULE >> Theme >> spaceship-prompt"
        git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
        ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

        # Set ZSH_THEME="spaceship" in your .zshrc.
    fi
fi
