#!/bin/bash

if command -v code >/dev/null; then
    echo "::[ Found ] VS Code"
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi
	mkdir -p "$VSCODE_HOME/User"

    echo "::[ Linking ] VS Code --> Settings"
	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"

	# ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"

    echo "::[ Linking ] VS Code --> Snippets"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	while read -r module; do
        echo "::[ Installing ] VS Code --> Extension: {{ $module }}"
        code --install-extension "$module" || true
	done <"$DOTFILES/vscode/extensions.txt"
fi
