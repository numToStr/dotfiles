require('nvim-treesitter.configs').setup({
    ensure_installed = 'maintained',
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- Or you can define your own textobjects like this
                -- ["iF"] = {
                --     python = "(function_definition) @function",
                --     cpp = "(function_definition) @function",
                --     c = "(function_definition) @function",
                --     java = "(method_declaration) @function",
                -- },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
})
-- vim.cmd('set foldmethod=expr')
-- vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
