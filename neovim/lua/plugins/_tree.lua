local U = require "utils"
local g = vim.g
local cmd = vim.cmd
local exec = vim.api.nvim_exec

g.lua_tree_side = "left"
g.lua_tree_width = 35
g.lua_tree_ignore = { ".git", "node_modules" }

-- 0 by default, opens the tree when typing `vim $DIR` or `vim`
-- g.lua_tree_auto_open = 1

-- 0 by default, closes the tree when it's the last window
g.lua_tree_auto_close = 1

-- 0 by default, this option allows the cursor to be updated when entering a buffer
g.lua_tree_follow = 1

-- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.lua_tree_git_hl = 1

-- 0 by default, this option shows indent markers when folders are open
-- g.lua_tree_indent_markers = 1

-- 0 by default, this option hides files and folders starting with a dot `.`
-- g.lua_tree_hide_dotfiles = 1

-- This is the default. See :help filename-modifiers for more options
-- g.lua_tree_root_folder_modifier = ':~'

-- 0 by default, will open the tree when entering a new tab and the tree was previously open
-- g.lua_tree_tab_open = 1


-- "If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- "1 by default, notice that if 'files' is 1, it will only display
-- "if nvim-web-devicons is installed and on your runtimepath
-- g.lua_tree_show_icons = {
--     git = 1,
--     folders = 0,
--     files = 0,
-- }

-- U.map("n", "<C-N>", ":LuaTreeToggle<CR>")

-- " default will show icon by default if no icon is provided
-- " default shows no icon by default
g.lua_tree_icons = {
    default = '',
    -- symlink = '',
    git = {
        unstaged = "M",
        staged = "A",
        unmerged = "═",
        renamed = "R",
        untracked = "U"
    },
    -- folder = {
    --     default = "",
    --     open = ""
    -- }
}

-- U.augroup("LuaTreeOverride", function lua_tree_override()
--     cmd("au FileType LuaTree setlocal nowrap")
-- end)

-- a list of groups can be found at `:help lua_tree_highlight`
-- highlight LuaTreeFolderIcon guifg=TermCursor
U.highlights({
    LuaTreeFolderIcon = { fg = 'TermCursor' }
})

exec(
    [[
        augroup LuaTreeOverride
          au!
          au FileType LuaTree setlocal nowrap
        augroup END
    ]],
    ""
)


-- " Disable default mappings by plugin
-- " Bindings are enable by default, disabled on any non-zero value
-- " let lua_tree_disable_keybindings=1
--
-- " You can edit keybindings be defining this variable
-- " You don't have to define all keys.
-- " NOTE: the 'edit' key will wrap/unwrap a folder and open a file
-- let g:lua_tree_bindings = {
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
