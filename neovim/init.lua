local D = os.getenv('DOTFILES')
local o = vim.o

-- This is a magic line that will take your pain away.
o.rtp = string.format('%s/neovim,%s', D, o.rtp)

vim.cmd('source' .. D .. '/neovim/plugins.vim')

require "_settings"
require "_colorizer"
require "_autocmd"
require "_keybinds"
require "_theme"
require "_fzf"
require "_statusline"
require "_easymotion"
require "_indentline"
require "_nerdtree"
require "_tmux-navigator"
require "_git-messenger"
require "_floaterm"
require "_coc"

-- require "_tree"
-- require "_devicons"
-- require "_goyo"

