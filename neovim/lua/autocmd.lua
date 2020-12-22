-- Currently, there is no interface to create user commands in Lua. It is planned, though:
-- PR: https://github.com/neovim/neovim/pull/12378

local cmd = vim.cmd
local api = vim.api
local U = require'utils'

-- Auto save files when focus is lost
-- cmd("au FocusLost * :wa")
U.define_autocmd({
    event = 'FocusLost',
    pattern = '*',
    command = 'silent! wa'
})
U.define_autocmd({
    event = 'BufNewFile,BufRead',
    pattern = '.prettierrc,.eslintrc',
    command = 'setf json'
})
U.define_autocmd({
    event = 'BufNewFile,BufRead',
    pattern = '*ignore',
    command = 'setf gitignore'
})

-- tsconfig.json supports comments and json5 enables comments
U.define_autocmd({
    event = 'BufNewFile,BufRead',
    pattern = 'tsconfig.json',
    command = 'setlocal filetype=json5'
})

-- Appending the extra file types for vim-snippets to show react snippets
-- Messing with prettier
-- cmd("au BufRead,BufNewFile *.jsx setlocal filetype=javascript.javascriptreact.javascript_react")
-- cmd("au BufRead,BufNewFile *.tsx setlocal filetype=typescript.typescriptreact.javascript_react")

-- Open help vertically and press q to exit
function help_tab()
    if vim.bo.buftype == 'help' then
        cmd('wincmd L')
        local nr = api.nvim_get_current_buf()
        api.nvim_buf_set_keymap(nr, "", "q", ":q<CR>", { noremap = true, silent = true })
    end
end
cmd("au BufEnter *.txt lua help_tab()")
