local U = require('utils')
local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.api.nvim_command

cmd('syntax on')
cmd('filetype plugin indent on')

o.compatible = false
o.encoding = 'UTF-8'
o.termguicolors = true
o.background = 'dark'

o.hidden = true
o.timeoutlen = 500
o.updatetime = 100
o.ttyfast = true

-- I have to set these individually as neovim doesn't update those
o.scrolloff = 8
wo.scrolloff = 8

o.showcmd = true
o.wildmenu = true

wo.number = true
wo.numberwidth = 6
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.cursorline = true

-- To fix a neovim bug affecting indent-blankline
-- Related: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
wo.colorcolumn = '99999'

o.expandtab = true
o.smarttab = true
o.tabstop = 4
o.cindent = true
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
o.clipboard = 'unnamedplus'

wo.wrap = true
bo.textwidth = 300
bo.formatoptions = 'qrn1'

o.hlsearch = true
o.ignorecase = true
o.smartcase = true

o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.backupdir = '/tmp/'
o.directory = '/tmp/'
o.undodir = '/tmp/'

o.completeopt = 'menuone,noselect'

-- Map <leader> to space
U.map('n', '<SPACE>', '<Nop>')
g.mapleader = ' '
