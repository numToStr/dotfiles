local M = {}

function M.config()
    local U = require "utils"

    vim.g.tmux_navigator_no_mappings = 1

    U.map("n", "<A-h>", ":TmuxNavigateLeft<CR>")
    U.map("n", "<A-j>", ":TmuxNavigateDown<CR>")
    U.map("n", "<A-k>", ":TmuxNavigateUp<CR>")
    U.map("n", "<A-l>", ":TmuxNavigateRight<CR>")
end

return M
