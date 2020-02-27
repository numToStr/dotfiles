#!/bin/sh
# neovim
if command -v nvim >/dev/null 2>&2; then
	alias vim='nvim'
	alias vi='nvim'
	alias v='nvim'
fi
