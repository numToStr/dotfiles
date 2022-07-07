vim.keymap.set('n', '<A-i>', "<CMD>lua require('FTerm').toggle()<CR>")
vim.keymap.set('t', '<A-i>', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
vim.keymap.set('n', '<A-g>', '<CMD>lua require("FTerm"):new({ cmd = { "gitui" } }):open()<CR>')
