local K = require('numToStr.keymap')

-- Fix * (Keep the cursor position, don't move to next match)
K.n('*', '*N')

-- Visual * and # search
-- Until https://github.com/neovim/neovim/pull/15472 is merged
K.x('*', 'y/\\V<C-R>"<CR>')
K.x('#', 'y?\\V<C-R>"<CR>')

-- Fix n and N. Keeping cursor in center
K.n('n', 'nzz')
K.n('N', 'Nzz')

-- Mimic shell movements
K.i('<C-E>', '<ESC>A')
K.i('<C-A>', '<ESC>I')

-- Fast execute macro
K.x('<S-q>', '<CMD>normal @@<CR>')
K.n('<S-q>', '<CMD>normal @@<CR>')

-- Quickly save the current buffer or all buffers
K.n('<leader>w', '<CMD>update<CR>')
K.n('<leader>W', '<CMD>wall<CR>')

-- Quit neovim
K.n('<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
K.n('<leader>o', 'o<ESC>')
K.n('<leader>O', 'O<ESC>')

-- Move to the next/previous buffer
K.n('<leader>[', '<CMD>bp<CR>')
K.n('<leader>]', '<CMD>bn<CR>')

-- Move to last buffer
K.n("''", '<CMD>b#<CR>')

-- Copying the vscode behaviour of making tab splits
K.n('<C-\\>', '<CMD>vsplit<CR>')
K.n('<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
K.n('<C-j>', '<CMD>move .+1<CR>')
K.n('<C-k>', '<CMD>move .-2<CR>')
K.v('<C-j>', "<CMD>move '>+1<CR>gv=gv")
K.v('<C-k>', "<CMD>move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
K.o('A', '<CMD>normal! mzggVG<CR>`z')
K.x('A', '<CMD>normal! ggVG<CR>')
