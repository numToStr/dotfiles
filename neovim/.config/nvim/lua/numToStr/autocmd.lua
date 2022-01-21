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
})

require('numToStr.au').group('NUMTOSTR', function(aucmd)
    -- Open help vertically and press q to exit
    aucmd.BufEnter = {
        '*.txt',
        function()
            if vim.bo.buftype == 'help' then
                vim.api.nvim_command('wincmd L')
                vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<CMD>q<CR>', { noremap = true })
            end
        end,
    }

    -- Highlight the region on yank
    aucmd.TextYankPost = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end
end)
