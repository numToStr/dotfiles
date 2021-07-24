local U = require('utils')

require('Navigator').setup({
    auto_save = 'current',
})

U.map('n', '<A-h>', ':lua require("Navigator").left()<CR>')
U.map('n', '<A-k>', ':lua require("Navigator").up()<CR>')
U.map('n', '<A-l>', ':lua require("Navigator").right()<CR>')
U.map('n', '<A-j>', ':lua require("Navigator").down()<CR>')
