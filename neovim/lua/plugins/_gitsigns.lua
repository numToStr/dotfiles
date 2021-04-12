local M = {}

function M.config()
    require("gitsigns").setup(
        {
            signs = {
                add = {text = "+"},
                change = {text = "~"},
                changedelete = {text = "="}
            }
        }
    )
end

return M
