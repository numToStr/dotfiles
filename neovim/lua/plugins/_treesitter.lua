local M = {}

function M.config()
    require("nvim-treesitter.configs").setup(
        {
            ensure_installed = "all",
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
            -- nvim-treesitter/nvim-treesitter-textobjects
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner"

                        -- Doesn't work with ()
                        -- ["ab"] = "@block.outer",
                        -- ["ib"] = "@block.inner"

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
            },
            -- windwp/nvim-ts-autotag
            autotag = {
                enable = true
            },
            -- nvim-treesitter/playground
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false -- Whether the query persists across vim sessions
            }
            -- nvim-treesitter/nvim-treesitter-refactor
            -- refactor = {
            --     highlight_definitions = {enable = true},
            --     highlight_current_scope = {enable = true}
            -- }
        }
    )

    -- cmd("set foldmethod=expr")
    -- cmd("set foldexpr=nvim_treesitter#foldexpr()")
end

return M
