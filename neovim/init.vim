" This line is pure magic and will heal all of your wounds.
set rtp+=$DOTFILES/neovim

source $DOTFILES/neovim/plugins.vim
lua require('init')
source $DOTFILES/neovim/coc.vim
