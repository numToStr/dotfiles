vim.keymap.set('n', '<leader>x', '<CMD>lua require("Buffers").only()<CR>')
vim.keymap.set('n', '<leader>X', '<CMD>lua require("Buffers").clear()<CR>')
vim.keymap.set('n', '<leader>q', '<CMD>lua require("Buffers").delete()<CR>')
