local K = require('numToStr.keymap')

K.n('<leader>x', '<CMD>lua require("Buffers").only()<CR>')
K.n('<leader>X', '<CMD>lua require("Buffers").clear()<CR>')
K.n('<leader>q', '<CMD>lua require("Buffers").delete()<CR>')
