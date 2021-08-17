local U = require('utils')
local g = vim.g

g.nvim_tree_side = 'left'
g.nvim_tree_width = 35
g.nvim_tree_ignore = { '.git', 'node_modules' }

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

-- 0 by default, will enable folder and file icon highlight for opened files/directories.
-- g.nvim_tree_highlight_opened_files = 1

-- 0 by default, this option hides files and folders starting with a dot `.`
-- g.nvim_tree_hide_dotfiles = 1

-- This is the default. See :help filename-modifiers for more options
-- g.nvim_tree_root_folder_modifier = ':~'

-- 0 by default, will open the tree when entering a new tab and the tree was previously open
-- g.nvim_tree_tab_open = 1

-- 0 by default, will disable the window picker.
g.nvim_tree_disable_window_picker = 1

-- "If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- "1 by default, notice that if 'files' is 1, it will only display
-- "if nvim-web-devicons is installed and on your runtimepath
-- If I don't set these then a leading indent marker will show bcz of `folder_arrows`
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}

-- " default will show icon by default if no icon is provided
-- " default shows no icon by default
g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = '~',
        staged = '+',
        unmerged = '!',
        renamed = '≈',
        untracked = '?',
        deleted = '-',
    },
}

U.map('n', '<C-n>', ':NvimTreeToggle<CR>')

local normal = U.get_hl_color('Normal', 'both')

local git_hi = { fg = normal.fg, gui = 'bold' }

U.highlights({
    NvimTreeGitDirty = git_hi,
    NvimTreeGitStaged = git_hi,
    NvimTreeGitMerge = git_hi,
    NvimTreeGitNew = git_hi,
    NvimTreeGitRenamed = git_hi,
    NvimTreeGitDeleted = git_hi,
})

require('au').augroup('NvimTreeOverrides', {
    {
        event = 'FileType',
        pattern = 'NvimTree',
        callback = function()
            vim.api.nvim_win_set_option(0, 'wrap', false)
        end,
    },
})
