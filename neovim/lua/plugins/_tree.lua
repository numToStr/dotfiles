local M = {}

function M.config()
    local U = require "utils"
    local g = vim.g

    g.nvim_tree_side = "left"
    g.nvim_tree_width = 35
    g.nvim_tree_ignore = {".git", "node_modules"}

    -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
    -- g.nvim_tree_auto_open = 1

    -- 0 by default, closes the tree when it's the last window
    -- g.nvim_tree_auto_close = 0

    -- 0 by default, this option allows the cursor to be updated when entering a buffer
    g.nvim_tree_follow = 1

    -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
    -- g.nvim_tree_git_hl = 1

    -- 0 by default, this option shows indent markers when folders are open
    g.nvim_tree_indent_markers = 1

    -- 0 by default, this option hides files and folders starting with a dot `.`
    -- g.nvim_tree_hide_dotfiles = 1

    -- This is the default. See :help filename-modifiers for more options
    -- g.nvim_tree_root_folder_modifier = ':~'

    -- 0 by default, will open the tree when entering a new tab and the tree was previously open
    -- g.nvim_tree_tab_open = 1

    -- "If 0, do not show the icons for one of 'git' 'folder' and 'files'
    -- "1 by default, notice that if 'files' is 1, it will only display
    -- "if nvim-web-devicons is installed and on your runtimepath
    -- g.nvim_tree_show_icons = {
    --     git = 1,
    --     folders = 0,
    --     files = 0,
    -- }

    -- " default will show icon by default if no icon is provided
    -- " default shows no icon by default
    g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            unstaged = "~",
            staged = "+",
            unmerged = "!",
            renamed = "≈",
            untracked = "?",
            deleted = "-"
        }
    }

    -- U.augroup("LuaTreeOverride", function nvim_tree_override()
    --     cmd("au FileType LuaTree setlocal nowrap")
    -- end)

    -- a list of groups can be found at `:help nvim_tree_highlight`

    U.map("n", "<C-N>", ":NvimTreeToggle<CR>")

    -- " Disable default mappings by plugin
    -- " Bindings are enable by default, disabled on any non-zero value
    -- " let nvim_tree_disable_keybindings=1
    --
    -- " You can edit keybindings be defining this variable
    -- " You don't have to define all keys.
    -- " NOTE: the 'edit' key will wrap/unwrap a folder and open a file
    -- let g:nvim_tree_bindings = {
    --     \ 'edit':            ['<CR>', 'o'],
    --     \ 'edit_vsplit':     '<C-v>',
    --     \ 'edit_split':      '<C-x>',
    --     \ 'edit_tab':        '<C-t>',
    --     \ 'toggle_ignored':  'I',
    --     \ 'toggle_dotfiles': 'H',
    --     \ 'refresh':         'R',
    --     \ 'preview':         '<Tab>',
    --     \ 'cd':              '<C-]>',
    --     \ 'create':          'a',
    --     \ 'remove':          'd',
    --     \ 'rename':          'r',
    --     \ 'cut':             'x',
    --     \ 'copy':            'c',
    --     \ 'paste':           'p',
    --     \ 'prev_git_item':   '[c',
    --     \ 'next_git_item':   ']c',
    --     }
    --
    -- nnoremap <C-n> :LuaTreeToggle<CR>
    -- nnoremap <leader>r :LuaTreeRefresh<CR>
    -- nnoremap <leader>n :LuaTreeFindFile<CR>
    -- " LuaTreeOpen and LuaTreeClose are also available if you need them
end

require("au").augroup(
    "NvimTreeOverrides",
    {
        {
            event = "FileType",
            pattern = "NvimTree",
            callback = function()
                vim.api.nvim_win_set_option(0, "wrap", false)
            end
        }
    }
)

return M
