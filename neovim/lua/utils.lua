local api = vim.api
local fn = vim.fn
local cmd = api.nvim_command

local U = {}

local function join(...)
    return table.concat({...}, " ")
end

-- Key mapping
function U.map(mode, key, result, opts)
    opts =
        vim.tbl_extend(
        "keep",
        opts or {},
        {
            noremap = true,
            silent = true,
            expr = false
        }
    )

    api.nvim_set_keymap(mode, key, result, opts)
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    local nr = api.nvim_get_current_buf()
    local buf = api.nvim_buf_get_name(nr)
    if string.find(buf, "NvimTree") and nr > 1 then
        cmd("wincmd l")
    end
end

-- Stolen from https://github.com/kyazdani42/nvim-palenight.lua/blob/master/lua/palenight.lua#L10
-- Usage:
-- highlight(Cursor, { fg = bg_dark, bg = yellow })
function U.highlight(group, styles)
    local gui = styles.gui or "NONE"
    local sp = styles.sp or "NONE"
    local fg = styles.fg or "NONE"
    local bg = styles.bg or "NONE"

    cmd("highlight! " .. group .. " gui=" .. gui .. " guisp=" .. sp .. " guifg=" .. fg .. " guibg=" .. bg)
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
    cmd("highlight link " .. src .. " " .. dest)
end

function U.hiLinks(hi_table)
    for src, dest in pairs(hi_table) do
        U.hiLink(src, dest)
    end
end

-- For getting hex color from hi group
-- Usage:
-- get_hl_color('Normal', 'fg' | 'bg')
function U.get_hl_color(name, attr)
    return fn.synIDattr(fn.hlID(name), attr)
end

-- Source: https://github.com/vheon/ycm.nvim/blob/master/lua/ycm/autocmd.lua
-- just some lua for defining autocmds.
-- It mimics https://github.com/neovim/neovim/pull/12076 so that when it is
-- merged we can just delete beyond this line

--#region autocommand
U._au_cb = {}

function U.define_autocmd_group(group, opts)
    cmd("augroup " .. group)
    if opts.clear then
        cmd("autocmd!")
    end
    cmd("augroup END")

    return group
end

local function lua_call(cb)
    local key = tostring(cb)
    U._au_cb[key] = cb
    return string.format("lua require'utils'._au_cb['%s']()", key)
end

function U.define_autocmd(spec)
    local event = spec.event

    if type(event) == "table" then
        event = table.concat(event, ",")
    end

    local group = spec.group or ""
    local pattern = spec.pattern or "*"
    local once = spec.once and "++once" or ""
    local nested = spec.nested and "++nested" or ""

    local action = spec.command or ""
    local callback = spec.callback
    if callback ~= nil then
        action = lua_call(callback)
    end

    local aucmd = join("autocmd", group, event, pattern, once, nested, action)

    cmd(aucmd)
end
--#endregion

return U
