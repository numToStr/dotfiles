-- TIP: If you want custom color of colorcolumn local to window
-- do
--     local ns = vim.api.nvim_create_namespace('gitcommit')
--     vim.api.nvim_set_hl(ns, 'ColorColumn', { link = 'CurSearch' })
--     vim.api.nvim_win_set_hl_ns(0, ns)
-- end
vim.api.nvim_set_option_value('textwidth', 72, { scope = 'local' })
vim.api.nvim_set_option_value('colorcolumn', '+0', { scope = 'local' })
