local au = require('numToStr.au')
local A = vim.api

local ft_ev = 'BufNewFile,BufRead'

au.group('MyFileTypes', {
    { ft_ev, '.eslintrc,.prettierrc,*.json*', 'set ft=json' },
    { ft_ev, '.eslintignore,.prettierignore,*.conf', 'set ft=conf' },
    { ft_ev, '*.env*', 'set ft=sh' },
    { ft_ev, '*.mdx', 'set ft=markdown' },
    { ft_ev, '*.mjml', 'set ft=html' },
    { ft_ev, '*tmux*', 'set ft=tmux' },
})

au.TextYankPost = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
end

-- Open help vertically and press q to exit
au.BufEnter = {
    '*.txt',
    function()
        if vim.bo.buftype == 'help' then
            A.nvim_command('wincmd L')
            A.nvim_buf_set_keymap(0, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
        end
    end,
}
