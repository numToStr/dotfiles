local M = {}

function M.config()
    N = require('Navigator')
    local U = require('utils')

    N.setup({
        auto_save = 'current',
    })

    U.map('n', '<A-h>', ':lua N.left()<CR>')
    U.map('n', '<A-k>', ':lua N.up()<CR>')
    U.map('n', '<A-l>', ':lua N.right()<CR>')
    U.map('n', '<A-j>', ':lua N.down()<CR>')
end

return M
