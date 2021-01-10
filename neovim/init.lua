local D = os.getenv('DOTFILES') or os.getenv('HOME')..'/.dotfiles'
local o = vim.o

-- This is a magic line that will take your pain away.
o.rtp = string.format('%s/neovim,%s', D, o.rtp)

-- Vanilla Config
require 'plugins'
require 'settings'
require 'autocmd'
require 'keybinds'

-- Plugins Config
require 'plugins/_theme'
require 'plugins/_colorizer'
require 'plugins/_statusline'
require 'plugins/_easymotion'
require 'plugins/_indentline'
require 'plugins/_nerdtree'
require 'plugins/_tmux-navigator'
require 'plugins/_git-messenger'
require 'plugins/_term'
require 'plugins/_coc'
require 'plugins/_telescope'

-- require "plugins/_tree"
-- require "plugins/_devicons"
-- require "plugins/_goyo"
-- require 'plugins/_fzf'
