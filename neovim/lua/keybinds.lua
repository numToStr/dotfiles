local U = require "utils"

-- Interfering with <leader>q
U.map("n", "<S-q>", "<Nop>")

U.map("n", "<S-Y>", "y$")
U.map("i", "<C-E>", "<ESC>A")
U.map("i", "<C-A>", "<ESC>I")

-- Fast execute macro
U.map('x' ,'Q', ':normal @@<CR>')
U.map('n' ,'Q', ':normal @@<CR>')

U.map("n", "<leader>w", ":w!<CR>")
U.map("n", "<leader>n", ":nohl<CR>")
U.map("n", "<C-Q>", ":q<CR>")

-- leader-o/O inserts blank line below/above
U.map("n", "<leader>o", "o<ESC>")
U.map("n", "<leader>O", "O<ESC>")

-- To open a new empty buffer
U.map("n", "<leader>T", ":enew<CR>")
-- Move to the previous buffer
U.map("n", "<leader>[", ":bp<CR>")
-- Move to the next buffer
U.map("n", "<leader>]", ":bn<CR>")
-- Show all open buffers and their status
U.map("n", "<leader>bl", ":ls<CR>")
-- Close the current buffer and move to the previous one
-- This replicates the idea of closing a tab
U.map("n", "<leader>q", ":Bdelete<CR>")
-- Close all buffers except the current one
U.map("n", "<leader>x", ":BufOnly<CR>")
-- Move to last buffer
U.map("n", "''", ":b#<CR>")
-- Copying the vscode behaviour of making tab splits
U.map("n", "<C-\\>", ":vsplit<CR>")
U.map("n", "<A-\\>", ":split<CR>")

-- Move line up and down => Ctrl+Shift+<key>
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
U.map("n", "<C-DOWN>", ":m .+1<CR>")
U.map("n", "<C-UP>", ":m .-2<CR>")

-- Edit r = shell rc
U.map("n", "'r", ":e ~/.zshrc<CR>")

--  Edit v = vimrc
U.map("n", "'v", ":e $MYVIMRC<CR>")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
U.map('o', 'A', ":<C-U>normal! ggVG<CR>")
