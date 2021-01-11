local api = vim.api
local cmd = vim.cmd
local U = {}

local function join(...)
  return table.concat({...}, " ")
end

-- Key mapping
function U.map(mode, key, result, opts)
    opts = vim.tbl_extend('keep', opts or {}, {
        noremap = true,
        silent = true,
        expr = false
    })

    api.nvim_set_keymap(mode, key, result, opts)
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    local nr = api.nvim_get_current_buf()
    local buf = api.nvim_buf_get_name(nr)
    if string.find(buf, 'NERD_tree') and nr > 1 then
        cmd('wincmd l')
    end
end

-- Stolen from https://github.com/kyazdani42/nvim-palenight.lua/blob/master/lua/palenight.lua#L10
-- Usage:
-- highlight(Cursor, { fg = bg_dark, bg = yellow })
function U.highlight(group, styles)
    local s = vim.tbl_extend('keep', styles, { gui = 'NONE', sp = 'NONE', fg = 'NONE', bg = 'NONE' })

    cmd('highlight! '..group..' gui='..s.gui..' guisp='..s.sp..' guifg='..s.fg..' guibg='..s.bg)
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
    cmd('highlight link '..src..' '..dest)
end

function U.hiLinks(hi_table)
    for src, dest in pairs(hi_table) do
        U.hiLink(src, dest)
    end
end

return U
