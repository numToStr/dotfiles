local U = require('utils')
local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
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

-- I have to set these individually as neovim doesn't update those
o.scrolloff = 8
wo.scrolloff = 8

-- Better editor UI
wo.number = true
wo.numberwidth = 6
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.cursorline = true

-- To fix a neovim bug affecting indent-blankline
-- Related: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
wo.colorcolumn = '99999'

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.tabstop = 4
o.cindent = true
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
wo.wrap = true
bo.textwidth = 300
-- bo.formatoptions = 'qrn1'

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

-- Completion menu option
o.completeopt = 'menuone,noselect'

-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen, which greatly speeds it up, upto 6-7x faster
o.lazyredraw = true

-- Map <leader> to space
U.map('n', '<SPACE>', '<Nop>')
g.mapleader = ' '
g.maplocalleader = ' '
