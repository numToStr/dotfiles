require('gruvbox-material').setup({
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
})

vim.api.nvim_command('colorscheme gruvbox-material')
