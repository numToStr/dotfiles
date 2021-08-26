local U = require('utils')

-- Fix * (Keep the cursor position, don't move to next match)
U.map('n', '*', '*N')

-- Visual * and # search
-- Until https://github.com/neovim/neovim/pull/15472 is merged
U.map('x', '*', 'y/\\V<C-R>"<CR>')
U.map('x', '#', 'y?\\V<C-R>"<CR>')

-- Fix n and N. Keeping cursor in center
U.map('n', 'n', 'nzz')
U.map('n', 'N', 'Nzz')

-- Mimic shell movements
U.map('i', '<C-E>', '<ESC>A')
U.map('i', '<C-A>', '<ESC>I')

-- Fast execute macro
U.map('x', '<S-q>', ':normal @@<CR>')
U.map('n', '<S-q>', ':normal @@<CR>')

-- Quickly save the current buffer or all buffers
U.map('n', '<leader>w', ':update<CR>')
U.map('n', '<leader>W', ':wall<CR>')

-- Quit neovim
U.map('n', '<C-Q>', ':q<CR>')

-- leader-o/O inserts blank line below/above
U.map('n', '<leader>o', 'o<ESC>')
U.map('n', '<leader>O', 'O<ESC>')

-- Move to the next/previous buffer
U.map('n', '<leader>[', ':bp<CR>')
U.map('n', '<leader>]', ':bn<CR>')

-- Move to last buffer
U.map('n', "''", ':b#<CR>')

-- Copying the vscode behaviour of making tab splits
U.map('n', '<C-\\>', ':vsplit<CR>')
U.map('n', '<A-\\>', ':split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
U.map('n', '<C-j>', ':move .+1<CR>')
U.map('n', '<C-k>', ':move .-2<CR>')
U.map('v', '<C-j>', ":move '>+1<CR>gv=gv")
U.map('v', '<C-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
U.map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
U.map('x', 'A', ':<C-U>normal! ggVG<CR>')
