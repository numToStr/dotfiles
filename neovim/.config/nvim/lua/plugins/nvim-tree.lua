local U = require('utils')
local g = vim.g

g.nvim_tree_ignore = { '.git', 'node_modules' }
g.nvim_tree_indent_markers = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}
g.nvim_tree_icons = {
    git = {
        unstaged = '~',
        staged = '+',
        unmerged = '!',
        renamed = '≈',
        untracked = '?',
        deleted = '-',
    },
}

require('nvim-tree').setup({
    lsp_diagnostics = true,
    update_focused_file = {
        enable = true,
    },
    view = {
        width = 35,
        side = 'left',
    },
})

U.map('n', '<C-n>', ':NvimTreeToggle<CR>')

require('au2').group('NvimTreeOverrides', function(grp)
    grp.FileType = {
        'NvimTree',
        function()
            vim.api.nvim_win_set_option(0, 'wrap', false)
        end,
    }
end)
