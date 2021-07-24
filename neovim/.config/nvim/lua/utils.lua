local api = vim.api
local cmd = api.nvim_command

local U = {}

-- Key mapping
function U.map(mode, key, result, opts)
    local options = { noremap = true, silent = true, expr = false }

    if opts then
        options = vim.tbl_extend('keep', opts, options)
    end

    api.nvim_set_keymap(mode, key, result, options)
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    if api.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
        cmd('wincmd l')
    end
end

-- Stolen from https://github.com/kyazdani42/nvim-palenight.lua/blob/master/lua/palenight.lua#L10
-- Usage:
-- highlight(Cursor, { fg = bg_dark, bg = yellow })
function U.highlight(group, styles)
    local gui = styles.gui or 'NONE'
    local sp = styles.sp or 'NONE'
    local fg = styles.fg or 'NONE'
    local bg = styles.bg or 'NONE'

    cmd('highlight! ' .. group .. ' gui=' .. gui .. ' guisp=' .. sp .. ' guifg=' .. fg .. ' guibg=' .. bg)
end

-- Usage:
-- highlight({
--      CursorLine   = { bg = bg },
--      Cursor       = { fg = bg_dark, bg = yellow }
-- })
function U.highlights(hi_table)
    for group, styles in pairs(hi_table) do
        U.highlight(group, styles)
    end
end

function U.hiLink(src, dest)
    cmd('highlight link ' .. src .. ' ' .. dest)
end

function U.hiLinks(hi_table)
    for src, dest in pairs(hi_table) do
        U.hiLink(src, dest)
    end
end

local function get_hex(rgb)
    return '#' .. require('bit').tohex(rgb, 6)
end

-- For getting hex color from hi group
-- Usage:
-- get_hl_color('Normal', 'fg' | 'bg' | 'both')
function U.get_hl_color(name, attr)
    local colors = api.nvim_get_hl_by_name(name, true)

    if attr == 'both' then
        return {
            fg = get_hex(colors.foreground),
            bg = get_hex(colors.background),
        }
    end

    if attr == 'fg' then
        return get_hex(colors.foreground)
    end

    if attr == 'bg' then
        return get_hex(colors.background)
    end
end

return U
