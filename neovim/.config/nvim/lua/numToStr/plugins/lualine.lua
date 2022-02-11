require('lualine').setup({
    options = {
        theme = 'sakura',
        component_separators = '',
        section_separators = '',
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
            { 'diagnostics' },
        },
        lualine_x = {
            'lsp_progress',
            'filetype',
            'encoding',
            'fileformat',
        },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location', color = { gui = 'bold' } },
        },
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_z = { 'tabs' },
    },
    extensions = { 'quickfix', 'nvim-tree' },
})
