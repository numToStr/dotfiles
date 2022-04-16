#!/bin/zsh

# Some low-priority but equally important stuff
# - xh
# - zenv
# - github-cli
# - glow
# - gitui
# - stylua
# - git-extras

zinit wait'1b' lucid light-mode from'gh-r' as'command' bpick'*linux*.tar.gz' for \
    numToStr/zenv \
    atload'alias h=xh' mv'xh* -> xh' pick'xh/xh' @ducaale/xh \
    mv'gh* -> gh' pick'gh/bin/gh' cli/cli \
    mv'hyperfine* -> hf' pick'hf/hyperfine' @sharkdp/hyperfine \
    charmbracelet/glow \

zinit wait'1c' lucid light-mode for \
    as"program" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX" tj/git-extras
