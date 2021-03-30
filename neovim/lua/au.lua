-- Source: https://github.com/vheon/ycm.nvim/blob/master/lua/ycm/autocmd.lua
-- just some lua for defining autocmds.
-- It mimics https://github.com/neovim/neovim/pull/12076 so that when it is
-- merged we can just delete beyond this line
local M = {}
local cmd = vim.api.nvim_command

M._au_cb = {}

local function join(...)
    return table.concat({...}, " ")
end

function M.augroup(group, au_specs)
    cmd("augroup " .. group)
    cmd("autocmd!")
    if au_specs ~= nil then
        for _, spec in ipairs(au_specs) do
            M.autocmd(spec)
        end
    end
    cmd("augroup END")

    return group
end

local function lua_call(cb)
    local key = tostring(cb)
    M._au_cb[key] = cb
    return string.format("lua require'au'._au_cb['%s']()", key)
end

function M.autocmd(spec)
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

return M
