local g = vim.g

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}
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

require('nvim-tree').setup({
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        width = 35,
        side = 'left',
    },
    filters = {
        custom = { '.git$', 'node_modules$', '^target$' },
    },
    git = {
        ignore = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
})

require('numToStr.keymap').n('<C-n>', '<CMD>NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true }),
    pattern = 'NvimTree',
    callback = function()
        vim.api.nvim_win_set_option(0, 'wrap', false)
    end,
})
