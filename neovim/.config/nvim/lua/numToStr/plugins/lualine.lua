require('lualine').setup({
    options = {
        theme = 'sakura',
        component_separators = '',
        section_separators = '',
        icons_enabled = true,
        globalstatus = true,
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
        lualine_a = {
            {
                'buffers',
                buffers_color = { active = 'lualine_b_normal' },
            },
        },
        lualine_z = {
            {
                'tabs',
                tabs_color = { active = 'lualine_b_normal' },
            },
        },
    },
    extensions = { 'quickfix', 'nvim-tree' },
})
