-- Bugs in vscode-neovim
--  * `za` doesn't toggle on folds
--  * `j` and `k` opens folds (use `gj` and `gk`)
--  * typing is not perfectly synced
--  * loses visual mode selection with ':move'

local g = vim.g
local o = vim.o
local map = vim.keymap.set
local notify = vim.fn.VSCodeNotify

---@param cmd string
---@return function
local function action(cmd)
    return function()
        return notify(cmd)
    end
end

-- Settings
g.mapleader = ' '
g.maplocalleader = ' '
o.clipboard = 'unnamedplus'
o.timeoutlen = 500
o.updatetime = 200

-- Keybindings
-- NOTE: Insert mode keybindings are controlled by vscode
map('n', '0', '^')
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

map({ 'n', 'x' }, '<leader>w', action('workbench.action.files.save'))
map({ 'n', 'x' }, '<leader>W', action('workbench.action.files.saveAll'))
map('n', '<leader>q', action('workbench.action.closeActiveEditor'))
map('n', '<leader>[', action('workbench.action.previousEditor'))
map('n', '<leader>]', action('workbench.action.nextEditor'))

map('n', 'gcc', '<Plug>VSCodeCommentaryLine')
map({ 'n', 'x', 'o' }, 'gc', '<Plug>VSCodeCommentary')

-- Autocommands
local num_au = vim.api.nvim_create_augroup('NUMTOSTR', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual' })
    end,
})

return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim')

        -- TODO
        -- * vim-surround
        -- * vim-easymotion
        -- * Navigator.nvim

        -- use({
        --     'numToStr/Navigator.nvim',
        --     event = 'CursorHold',
        --     config = function()
        --     end,
        -- })

        -- use({
        --     'phaazon/hop.nvim',
        --     event = 'BufRead',
        --     config = function()
        --         require('numToStr.plugins.hop')
        --     end,
        -- })

        -- use({
        --     'tpope/vim-surround',
        --     event = 'BufRead',
        --     requires = {
        --         {
        --             'tpope/vim-repeat',
        --             event = 'BufRead',
        --         },
        --     },
        -- })
    end,
})
