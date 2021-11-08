local U = require('utils')

U.map('n', '<leader>x', '<CMD>lua require("Buffers").only()<CR>')
U.map('n', '<leader>X', '<CMD>lua require("Buffers").clear()<CR>')
U.map('n', '<leader>q', '<CMD>lua require("Buffers").delete()<CR>')
