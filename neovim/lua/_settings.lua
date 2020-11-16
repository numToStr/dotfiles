local U = require "utils"
local g = vim.g
local go = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec

cmd("syntax on")
cmd("filetype plugin indent on")

go.compatible = false
go.encoding = 'UTF-8'
go.termguicolors = true
go.background = 'dark'

go.hidden = true
go.timeoutlen = 500
go.updatetime = 100
go.ttyfast = true
go.scrolloff = 8

go.showcmd = true
go.wildmenu = true

wo.number = true
wo.numberwidth = 6
wo.relativenumber = true
wo.signcolumn = "yes"
wo.cursorline = true

go.expandtab = true
go.smarttab = true
go.tabstop = 4
go.cindent = true
go.shiftwidth = 4
go.softtabstop = 4
go.autoindent = true
go.clipboard = "unnamedplus"

wo.wrap = true
bo.textwidth = 300
bo.formatoptions = "qrn1"

go.hlsearch = true
go.ignorecase = true
go.smartcase = true

go.backup = false
go.writebackup = false
go.undofile = true
go.backupdir = "/tmp/"
go.directory = "/tmp/"
go.undodir = "/tmp/"

-- Map <leader> to space
U.map("n", "<SPACE>", "<Nop>")
g.mapleader = " "


-- For highlighting yanked region
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 120 })')
