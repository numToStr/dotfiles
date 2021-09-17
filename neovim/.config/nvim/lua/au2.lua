local cmd = vim.api.nvim_command

local function autocmd(this, e, v)
    local is_table = type(v) == 'table'
    local pattern = is_table and v[1] or '*'
    local action = is_table and v[2] or v

    if type(action) == 'function' then
        action = this.set(action)
    end

    local ev = type(e) == 'table' and table.concat(e, ',') or e

    cmd('autocmd ' .. ev .. ' ' .. pattern .. ' ' .. action)
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

local A = setmetatable({}, {
    __index = B,
    __newindex = autocmd,
    __call = function(this, events, spec)
        this[events] = spec
    end,
})

return A
