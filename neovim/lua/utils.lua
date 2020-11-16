local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local U = {}

-- Key mapping
function U.map(mode, key, result, opts)
    opts = opts or {}

    fn.nvim_set_keymap(
        mode,
        key,
        result,
        {
            noremap = opts.noremap or true,
            silent = opts.silent or true,
            expr = opts.expr or false,
            script = opts.script or false
        }
    )
end

-- For setting environment variable
function U.setenv(k, v)
    vim.api.nvim_call_function("setenv", { k, v })
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    n = fn.bufname()
    nr = api.nvim_get_current_buf()
    if string.find(n, 'NERD_tree') and nr > 1 then
        -- cmd('exe "normal! \\<C-W>\\<C-W>"')
        cmd('wincmd l')
    end
end

-- Stolen from https://github.com/kyazdani42/nvim-palenight.lua/blob/master/lua/palenight.lua#L10
-- Usage:
-- highlight(Cursor, { fg = bg_dark, bg = yellow })
function U.highlight(group, styles)
    local gui = styles.gui and 'gui='..styles.gui or 'gui=NONE'
    local sp = styles.sp and 'guisp='..styles.sp or 'guisp=NONE'
    local fg = styles.fg and 'guifg='..styles.fg or 'guifg=NONE'
    local bg = styles.bg and 'guibg='..styles.bg or 'guibg=NONE'
    cmd('highlight '..group..' '..gui..' '..sp..' '..fg..' '..bg)
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
