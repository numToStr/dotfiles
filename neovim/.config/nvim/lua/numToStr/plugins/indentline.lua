local hooks = require('ibl.hooks')

require('ibl').setup({
    exclude = {
        filetypes = { 'help', 'packer', 'FTerm' },
        buftypes = { 'terminal', 'nofile' },
    },
})

hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
