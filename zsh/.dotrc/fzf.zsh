#!/bin/zsh

#######################################
# FZF deserves its own config         #
# Don't move it to zsh_config.zsh     #
#######################################

# Common fd command
FD="fd --hidden --follow --strip-cwd-prefix"

# Default TUI options
export FZF_DEFAULT_OPTS="
--multi
--keep-right
--no-mouse
--prompt '⯈ '
--marker=+
--preview-window='right:hidden:wrap'
--color=dark
--color=fg:250,fg+:15,hl:203,hl+:203
--color=info:100,pointer:15,marker:220,spinner:11,header:-1,gutter:-1,prompt:15
--layout=reverse
--height=60%
--border=rounded
"

# Default command to run to generate search entries
export FZF_DEFAULT_COMMAND="$FD --type f --type l"

# Command for `CTRL-T`
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Used for generating completions for `path`
# Ex: vim **<tab> runs _fzf_compgen_path()
_fzf_compgen_path() {
    eval "$FZF_DEFAULT_COMMAND -- $1"
}

# Used for generating completions for `directory`
# Ex: cd **<tab> runs _fzf_compgen_dir()
_fzf_compgen_dir() {
    eval "$FD --type d -- $1"
}
