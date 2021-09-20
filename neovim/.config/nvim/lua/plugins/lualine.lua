require('lualine').setup({
    options = {
        theme = 'sakura',
        component_separators = '',
        icons_enabled = true,
    },
    sections = {
        lualine_a = {
            { 'mode', color = { gui = 'bold' } },
        },
        lualine_b = {
            { 'branch' },
            { 'diff', colored = false },
        },
        lualine_c = {
            { 'filename', file_status = true },
            { 'diagnostics', sources = { 'coc' } },
        },
        lualine_x = {
            'g:coc_status',
            'filetype',
            'encoding',
            'fileformat',
        },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location', color = { gui = 'bold' } },
        },
    },
    extensions = { 'quickfix', 'nvim-tree' },
})
