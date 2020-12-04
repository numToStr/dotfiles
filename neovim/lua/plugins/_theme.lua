local U = require "utils"
local g = vim.g

g.gruvbox_material_background = "hard"
g.gruvbox_material_sign_column_background = "none"
-- g.gruvbox_material_transparent_background = 1
g.gruvbox_material_better_performance = 1

vim.cmd("colorscheme gruvbox-material")

-- These colors are used in fzf markers
-- And should be called after colorscheme command
U.highlights({
    MyWhite = { fg = "#ffffff" },
    MyBlack = { fg = "#1c1c1c" }
})
