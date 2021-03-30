-- Currently, there is no interface to create user commands in Lua. It is planned, though:
-- PR: https://github.com/neovim/neovim/pull/12378

local au = require("au")
local api = vim.api
local cmd = api.nvim_command

-- Auto save files when focus is lost
-- cmd("au FocusLost * :wa")
-- cmd("au FocusLost * silent! wa")

au.augroup(
    "MyFileTypes",
    {
        {
            event = "BufNewFile,BufRead",
            pattern = ".eslintrc,.prettierrc,.tsconfig.json",
            callback = function()
                vim.bo.filetype = "json"
            end
        },
        {
            event = "BufNewFile,BufRead",
            pattern = ".eslintignore,.prettierignore ",
            callback = function()
                vim.bo.filetype = "conf"
            end
        }
    }
)

-- Appending the extra file types for vim-snippets to show react snippets
-- Messing with prettier
-- cmd("au BufRead,BufNewFile *.jsx setlocal filetype=javascript.javascriptreact.javascript_react")
-- cmd("au BufRead,BufNewFile *.tsx setlocal filetype=typescript.typescriptreact.javascript_react")

-- Open help vertically and press q to exit
local function help_tab()
    if vim.bo.buftype == "help" then
        cmd("wincmd L")
        local nr = api.nvim_get_current_buf()
        api.nvim_buf_set_keymap(nr, "", "q", ":q<CR>", {noremap = true, silent = true})
    end
end

au.autocmd(
    {
        event = "BufEnter",
        pattern = "*.txt",
        callback = help_tab
    }
)

-- For highlighting yanked region
au.autocmd(
    {
        event = "TextYankPost",
        callback = function()
            vim.highlight.on_yank({higroup = "HighlightedyankRegion", timeout = 120})
        end
    }
)
