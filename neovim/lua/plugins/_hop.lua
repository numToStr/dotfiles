local M = {}

function M.config()
    local U = require('utils')

    U.map('n', '<S-J>', '<CMD>HopWordAC<CR>')
    U.map('n', '<S-K>', '<CMD>HopWordBC<CR>')
end

return M
