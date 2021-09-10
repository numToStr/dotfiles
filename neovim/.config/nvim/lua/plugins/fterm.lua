local U = require('utils')

U.map('n', '<A-i>', "<CMD>lua require('FTerm').toggle()<CR>")
U.map('t', '<A-i>', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")

U.map('n', '<A-g>', '<CMD>lua require("FTerm"):new({ cmd = "gitui" }):open()<CR>')
