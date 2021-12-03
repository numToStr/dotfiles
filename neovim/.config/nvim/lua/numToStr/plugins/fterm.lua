local K = require('numToStr.keymap')

K.n('<A-i>', "<CMD>lua require('FTerm').toggle()<CR>")
K.t('<A-i>', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
K.n('<A-g>', '<CMD>lua require("FTerm"):new({ cmd = "gitui" }):open()<CR>')
