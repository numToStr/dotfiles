#!/bin/zsh

#######################################
# FZF deserves its own config         #
# Don't move it to zsh_config.zsh     #
#######################################

# Configure fzf, command line fuzzyf finder
# Ignoring files will be handled by ~/.fdignore
FD_OPTIONS="--hidden --follow"
# FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules --exclude .npm"

# export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort'"
export FZF_DEFAULT_OPTS="--prompt '⯈ ' --marker=+ --keep-right --color=dark --layout=reverse --color=fg:250,fg+:15,hl:203,hl+:203 --color=info:100,pointer:15,marker:220,spinner:11,header:-1,gutter:-1,prompt:15"

# Use git-ls-files inside git repo, otherwise fd
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS || git ls-files --cached --others --exclude-standard"

export FZF_CTRL_T_COMMAND="fd --strip-cwd-prefix $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# Options to fzf command
export FZF_COMPLETION_OPTS="-x"

_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow . "$1"
}

