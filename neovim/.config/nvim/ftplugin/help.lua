-- Open help vertically and press q to exit
if vim.bo.buftype == 'help' then
    vim.api.nvim_command('wincmd L')
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<CMD>q<CR>', { noremap = true, silent = true })
end
