local au2 = require('au2')
local api = vim.api
local cmd = api.nvim_command

local ft_ev = 'BufNewFile,BufRead'

au2.group('MyFileTypes', {
    { ft_ev, '.eslintrc,.prettierrc,*.json*', 'set ft=json' },
    { ft_ev, '.eslintignore,.prettierignore,*.conf', 'set ft=conf' },
    { ft_ev, '*.env*', 'set ft=sh' },
    { ft_ev, '*.mdx', 'set ft=markdown' },
    { ft_ev, '*.mjml', 'set ft=html' },
    { ft_ev, '*tmux*', 'set ft=tmux' },
})

au2.TextYankPost = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
end

-- Open help vertically and press q to exit
au2.BufEnter = {
    '*.txt',
    function()
        if vim.bo.buftype == 'help' then
            cmd('wincmd L')
            local nr = api.nvim_get_current_buf()
            api.nvim_buf_set_keymap(nr, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
        end
    end,
}
