local U = require('utils')
local g = vim.g
local o = vim.o
local cmd = vim.api.nvim_command

-- cmd('syntax on')
cmd('filetype plugin indent on')

o.termguicolors = true
o.background = 'dark'

-- Do not save when switching buffers
o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 6
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true

-- To fix a neovim bug affecting indent-blankline
-- Related: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
o.colorcolumn = '99999'

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.backupdir = '/tmp/'
o.directory = '/tmp/'
o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
o.lazyredraw = true

-- Better folds (don't fold by default)
o.foldmethod = 'indent'
o.foldlevelstart = 99
o.foldnestmax = 3
o.foldminlines = 1

-- Map <leader> to space
U.map('n', '<SPACE>', '<Nop>')
g.mapleader = ' '
g.maplocalleader = ' '
