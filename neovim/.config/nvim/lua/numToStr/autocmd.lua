local A = vim.api

vim.g.did_load_filetypes = 0 -- Disable vim-based filetype plugin
vim.g.do_filetype_lua = 1 -- Enable lua-based filetype plugin

-- Custom filetypes
vim.filetype.add({
    extension = {
        eslintrc = 'json',
        prettierrc = 'json',
        conf = 'conf',
        mdx = 'markdown',
    },
    pattern = {
        ['.*%.env.*'] = 'sh',
        ['.*ignore'] = 'conf',
        -- ['.*tmux.*conf$'] = 'tmux',
    },
    filename = {
        ['yup.lock'] = 'yaml',
    },
})

local num_au = A.nvim_create_augroup('NUMTOSTR', { clear = true })

-- Open help vertically and press q to exit
A.nvim_create_autocmd('BufEnter', {
    group = num_au,
    pattern = '*.txt',
    callback = function()
        if vim.bo.buftype == 'help' then
            A.nvim_command('wincmd L')
            A.nvim_buf_set_keymap(0, 'n', 'q', '<CMD>q<CR>', { noremap = true })
        end
    end,
})

-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})
