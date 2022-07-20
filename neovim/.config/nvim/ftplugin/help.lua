-- Open help vertically and press q to exit
vim.api.nvim_cmd({ cmd = 'wincmd', args = { 'L' } }, {})
vim.keymap.set('n', 'q', '<CMD>q<CR>', { buffer = 0 })
