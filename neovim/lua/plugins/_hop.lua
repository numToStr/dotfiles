local M = {}

function M.config()
    local U = require "utils"

    U.highlights(
        {
            HopNextKey = {bg = "#ffffff", fg = "#1c1c1c"},
            HopNextKey1 = {bg = "#ffffff", fg = "#1c1c1c"},
            HopNextKey2 = {bg = "#ffffff", fg = "#1c1c1c"}
        }
    )

    -- U.map("n", "<S-m>", "<CMD>lua require'hop'.hint_words()<CR>")

    -- These are mapping are legacy reasons, because I used them with easymotion
    -- Maybe I remove them in future, once I used to the above mapping
    U.map("n", "<S-J>", "<CMD>lua require'hop'.hint_words()<CR>")
    U.map("n", "<S-K>", "<CMD>lua require'hop'.hint_words()<CR>")
end

return M
