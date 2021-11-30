local U = require('numToStr.utils')

require('Navigator').setup({
    auto_save = 'current',
})

U.map('n', '<A-h>', '<CMD>lua require("Navigator").left()<CR>')
U.map('n', '<A-k>', '<CMD>lua require("Navigator").up()<CR>')
U.map('n', '<A-l>', '<CMD>lua require("Navigator").right()<CR>')
U.map('n', '<A-j>', '<CMD>lua require("Navigator").down()<CR>')
