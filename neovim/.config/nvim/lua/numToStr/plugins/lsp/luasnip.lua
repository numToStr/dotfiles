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

-- Mappins to move around inside snippets
local K = require('numToStr.keymap')

K.i('<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
K.i('<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
K.s('<C-j>', '<CMD>lua require("luasnip").jump(1)<CR>')
K.s('<C-k>', '<CMD>lua require("luasnip").jump(-1)<CR>')
