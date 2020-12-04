local U = require "utils"
local g = vim.g

g.floaterm_autoclose = 2
g.floaterm_title = false
g.floaterm_rootmarkers = { ".git", ".gitignore" }

U.map("n", "<A-i>", ":FloatermToggle<CR>")
U.map("t", "<A-i>", "<C-\\><C-n>:FloatermToggle<CR>")
