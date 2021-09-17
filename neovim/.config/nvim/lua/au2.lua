-- Remove after https://github.com/neovim/neovim/pull/14661 is merged
local cmd = vim.api.nvim_command

local function autocmd(this, event, spec)
    local is_table = type(spec) == 'table'
    local pattern = is_table and spec[1] or '*'
    local action = is_table and spec[2] or spec
    if type(action) == 'function' then
        action = this.set(action)
    end
    local e = type(event) == 'table' and table.concat(event, ',') or event
    cmd('autocmd ' .. e .. ' ' .. pattern .. ' ' .. action)
end

local B = {
    __au = {},
}

function B.exec(id)
    B.__au[id]()
end

function B.set(fn)
    local id = string.format('%p', fn)
    B.__au[id] = fn
    return string.format('lua require("au2").exec("%s")', id)
end

function B.group(grp, cmds)
    cmd('augroup ' .. grp)
    cmd('autocmd!')
    for _, au in ipairs(cmds) do
        autocmd(B, au[1], { au[2], au[3] })
    end
    cmd('augroup END')
end

return setmetatable({}, {
    __index = B,
    __newindex = autocmd,
    __call = autocmd,
})
