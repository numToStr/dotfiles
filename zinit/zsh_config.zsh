#!/bin/zsh

#####################
# SETOPT            #
#####################
# set -o emacs
# setopt vi
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu

#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# ENV               #
#####################
ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster
export EDITOR=nvim
export PAGER=bat
export DOCKER_BUILDKIT=1 # For enabling buildkit backend in docker and docker-compose
export COMPOSE_DOCKER_CLI_BUILD=1
export CGO_ENABLED=1
export CGO_CFLAGS="-g -O2 -Wno-return-local-addr"

#####################
# PATH              #
#####################
export DOT_BIN="$DOTFILES/bin:$HOME/.bin"
export GOPATH="$HOME/go/"
export GOBIN="$GOPATH/bin"
export PATH="$DOT_BIN:$GOBIN:$PATH"
