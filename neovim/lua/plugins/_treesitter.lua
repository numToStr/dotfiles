require("nvim-treesitter.configs").setup(
    {
        ensure_installed = "maintained",
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false -- Whether the query persists across vim sessions
        },
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
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner"

                    -- Or you can define your own textobjects like this
                    -- ["iF"] = {
                    --     python = "(function_definition) @function",
                    --     cpp = "(function_definition) @function",
                    --     c = "(function_definition) @function",
                    --     java = "(method_declaration) @function",
                    -- },
                }
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner"
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner"
                }
            }
        }
    }
)

-- vim.api.nvim_command('set foldmethod=expr')
-- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
