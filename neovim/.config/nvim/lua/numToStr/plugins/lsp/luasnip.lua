local types = require('luasnip.util.types')

require('luasnip').config.setup({
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { '●', 'DiffAdd' } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { '●', 'DiffDelete' } },
            },
        },
    },
})

-- Loading any vscode snippets from plugins
require('luasnip.loaders.from_vscode').lazy_load()

-- Allow jsx and tsx to use js snippets
require('luasnip').filetype_extend('javascript', { 'javascriptreact', 'typescriptreact' })

-- Mappins to move around inside snippets
vim.keymap.set('i', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set('i', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
vim.keymap.set('s', '<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set('s', '<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
