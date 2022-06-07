require('Navigator').setup({
    auto_save = 'current',
})

vim.keymap.set('n', '<A-h>', '<CMD>lua require("Navigator").left()<CR>')
vim.keymap.set('n', '<A-k>', '<CMD>lua require("Navigator").up()<CR>')
vim.keymap.set('n', '<A-l>', '<CMD>lua require("Navigator").right()<CR>')
vim.keymap.set('n', '<A-j>', '<CMD>lua require("Navigator").down()<CR>')
