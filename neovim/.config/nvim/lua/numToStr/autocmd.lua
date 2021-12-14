local A = vim.api

local extensions = {
    ['%.eslintrc$'] = 'json',
    ['%.eslintignore$'] = 'conf',
    ['%.prettierrc$'] = 'json',
    ['%.prettierignore$'] = 'conf',
    ['%.conf$'] = 'conf',
    ['.*%.env.*'] = 'sh',
    ['%.mdx$'] = 'markdown',
    ['%.mjml$'] = 'html',
    ['.*tmux.*conf'] = 'tmux',
}

require('numToStr.au').group('NUMTOSTR', function(aucmd)
    -- Custom filetypes
    aucmd('BufNewFile,BufRead', function()
        local bufnr = A.nvim_get_current_buf()
        local path = A.nvim_buf_get_name(bufnr)
        if #path == 0 then
            return
        end
        for ext, ft in pairs(extensions) do
            if path:match('.*/(.*)$'):find(ext) then
                A.nvim_buf_set_option(bufnr, 'filetype', ft)
            end
        end
    end)

    -- Open help vertically and press q to exit
    aucmd.BufEnter = {
        '*.txt',
        function()
            if vim.bo.buftype == 'help' then
                A.nvim_command('wincmd L')
                A.nvim_buf_set_keymap(0, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
            end
        end,
    }

    -- Highlight the region on yank
    aucmd.TextYankPost = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end
end)
