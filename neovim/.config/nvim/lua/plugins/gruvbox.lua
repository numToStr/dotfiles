vim.g.gruvbox_material = {
    background = 'hard',
    diagnostic_text_highlight = true,
    plugins = {
        'treesitter',
        'coc',
        'telescope',
        'hop.nvim',
        'nvim-tree',
        'gitsigns',
    },
}

vim.api.nvim_command('colorscheme gruvbox-material')

require('au').augroup('ColorSchemeOverrides', {
    {
        event = 'ColorScheme',
        callback = function()
            local U = require('utils')

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
        end,
    },
})
