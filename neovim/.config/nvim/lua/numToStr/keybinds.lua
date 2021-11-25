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
U.map('x', '<S-q>', '<CMD>normal @@<CR>')
U.map('n', '<S-q>', '<CMD>normal @@<CR>')

-- Quickly save the current buffer or all buffers
U.map('n', '<leader>w', '<CMD>update<CR>')
U.map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
U.map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
U.map('n', '<leader>o', 'o<ESC>')
U.map('n', '<leader>O', 'O<ESC>')

-- Move to the next/previous buffer
U.map('n', '<leader>[', '<CMD>bp<CR>')
U.map('n', '<leader>]', '<CMD>bn<CR>')

-- Move to last buffer
U.map('n', "''", '<CMD>b#<CR>')

-- Copying the vscode behaviour of making tab splits
U.map('n', '<C-\\>', '<CMD>vsplit<CR>')
U.map('n', '<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
U.map('n', '<C-j>', '<CMD>move .+1<CR>')
U.map('n', '<C-k>', '<CMD>move .-2<CR>')
U.map('v', '<C-j>', "<CMD>move '>+1<CR>gv=gv")
U.map('v', '<C-k>', "<CMD>move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
U.map('o', 'A', '<CMD><C-U>normal! mzggVG<CR>`z')
U.map('x', 'A', '<CMD><C-U>normal! ggVG<CR>')
