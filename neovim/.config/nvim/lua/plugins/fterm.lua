local U = require('utils')

require('FTerm').setup()

U.map('n', '<A-i>', "<CMD>lua require('FTerm').toggle()<CR>")
U.map('t', '<A-i>', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")

-- gitui via FTerm
local term = require('FTerm.terminal')

local gitui = term:new():setup({
    cmd = 'gitui',
    dimensions = {
        height = 0.95,
        width = 0.95,
    },
})

function _G.__gitui()
    gitui:toggle()
end

U.map('n', '<A-g>', '<CMD>lua __gitui()<CR>')
U.map('t', '<A-g>', '<C-\\><C-n><CMD>lua __gitui()<CR>')
