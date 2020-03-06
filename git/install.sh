#!/bin/bash

# If hub is found, use https: instead of git: or ssh::
if command -v hub >/dev/null 2>&1; then
    git config --global hub.protocol https
fi

# use vscode as mergetool
if command -v code >/dev/null 2>&1; then
	git config --global merge.tool vscode
	git config --global mergetool.vscode.cmd "code --wait $MERGED"
fi
