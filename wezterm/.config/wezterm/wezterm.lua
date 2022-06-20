local W = require('wezterm')

return {
    -- default_prog = { 'wsl.exe' },
    -- default_domain = 'WSL:Arch',
    -- wsl_domains = {
    --     {
    --         name = 'WSL:Arch',
    --         distribution = 'Arch',
    --         default_cwd = '~',
    --     },
    -- },
    enable_scroll_bar = false,
    enable_tab_bar = false,
    enable_csi_u_key_encoding = true,
    audible_bell = 'Disabled',
    check_for_updates = false,
    font_size = 11.5,
    font = W.font({
        family = 'Fira Code',
        harfbuzz_features = {
            'cv04',
            'cv10',
            'ss04',
            'ss03',
            'cv25',
            'cv32',
            'cv28',
            'ss06',
            'ss07',
        },
    }),
    window_padding = {
        right = 0,
        left = 0,
        top = 0,
        bottom = 0,
    },
    colors = {
        foreground = '#e0def4',
        background = '#12121e',
        cursor_bg = '#dddddd',
        cursor_fg = '#12121e',
        selection_fg = '#12121e',
        selection_bg = '#FFFACD',
    },
}
