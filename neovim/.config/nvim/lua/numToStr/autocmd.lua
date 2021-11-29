local au = require('numToStr.au')

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
