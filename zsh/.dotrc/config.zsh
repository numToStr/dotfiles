#!/bin/zsh

#####################
# SETOPT            #
#####################

setopt autocd autopushd pushdignoredups
# set -o emacs
# setopt vi
# setopt extended_history       # record timestamp of command in HISTFILE
# setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
# setopt hist_ignore_all_dups   # ignore duplicated commands history list
# setopt hist_ignore_space      # ignore commands that start with space
# setopt hist_verify            # show command with history expansion to user before running it
# setopt inc_append_history     # add commands to HISTFILE in order of execution
# setopt share_history          # share command history data
# setopt always_to_end          # cursor moved to the end in full completion
# setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
# setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
# setopt complete_in_word       # allow completion from within a word/phrase
# setopt nocorrect                # spelling correction for commands
# setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
# setopt nolisttypes
# setopt listpacked
# setopt automenu

#####################
# HISTORY           #
#####################
# [ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
# HISTSIZE=290000
# SAVEHIST=$HISTSIZE

############
# DOTFILES #
############
export DOTFILES=${DOTFILES:-$HOME/.dotfiles}

#####################
# ENV               #
#####################
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export TERM=${TERM:-xterm-256color}
export COLORTERM=${COLORTERM:-truecolor}
export EDITOR=$(which nvim)
# export MANPAGER="nvim --clean +Man! +'setl noma' +'nn q :q!<CR>'"
# export PAGER=bat

# Update locales (Also fixes powerline fonts rendering inside tmux)
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# For enabling buildkit backend in docker and docker-compose
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export CGO_ENABLED=1
export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"

export ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
export DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster

#####################
# PATH              #
#####################
export LSP_BIN_PATH="$HOME/.local/lsp/bin"
export GOPATH="$HOME/go/"
export GOBIN="$GOPATH/bin"
export PATH="$LSP_BIN_PATH:$GOBIN:$PATH"
