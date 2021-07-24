-- Currently, there is no interface to create user commands in Lua. It is planned, though:
-- PR: https://github.com/neovim/neovim/pull/12378

local au = require('au')
local api = vim.api
local cmd = api.nvim_command

-- Auto save files when focus is lost
-- cmd("au FocusLost * :wa")
-- cmd("au FocusLost * silent! wa")

local filetypes = {
    { '*.gql,*.graphql', 'graphql' },
    { '.eslintrc,.prettierrc,*.json*', 'json' },
    { '.eslintignore,.prettierignore,*.conf', 'conf' },
    { '*.env*', 'sh' },
    { '*.mdx', 'markdown' },
    { '*.tf', 'terraform' },
}

local au_ft = {}

for _, ft in ipairs(filetypes) do
    table.insert(au_ft, {
        event = 'BufNewFile,BufRead',
        pattern = ft[1],
        callback = function()
            vim.bo.filetype = ft[2]
        end,
    })
end

au.augroup('MyFileTypes', au_ft)

-- Open help vertically and press q to exit
local function help_tab()
    if vim.bo.buftype == 'help' then
        cmd('wincmd L')
        local nr = api.nvim_get_current_buf()
        api.nvim_buf_set_keymap(nr, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
    end
end

au.autocmd({
    event = 'BufEnter',
    pattern = '*.txt',
    callback = help_tab,
})

-- For highlighting yanked region
au.autocmd({
    event = 'TextYankPost',
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})
