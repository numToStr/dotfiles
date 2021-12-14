return setmetatable({
    nore = { noremap = true, silent = true, expr = false },
    remap = { noremap = false, silent = true, expr = false },
}, {
    __index = function(p, mode)
        return setmetatable({
            map = function(key, action)
                vim.api.nvim_set_keymap(mode, key, action, p.remap)
            end,
            nmap = function(key, action)
                vim.api.nvim_set_keymap(mode, key, action, p.nore)
            end,
            bmap = function(buf, key, action)
                vim.api.nvim_buf_set_keymap(buf, mode, key, action, p.nore)
            end,
        }, {
            __call = function(this, key, action)
                this.nmap(key, action)
            end,
        })
    end,
})
