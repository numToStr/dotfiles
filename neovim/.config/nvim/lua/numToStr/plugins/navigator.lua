local K = require('numToStr.keymap')

require('Navigator').setup({
    auto_save = 'current',
})

K.n('<A-h>', '<CMD>lua require("Navigator").left()<CR>')
K.n('<A-k>', '<CMD>lua require("Navigator").up()<CR>')
K.n('<A-l>', '<CMD>lua require("Navigator").right()<CR>')
K.n('<A-j>', '<CMD>lua require("Navigator").down()<CR>')
