-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.configs').setup({
    -- nvim-treesitter/nvim-treesitter (self config)
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<leader>si',
            node_incremental = '<leader>sn',
            node_decremental = '<leader>sN',
            scope_incremental = '<leader>sc',
        },
    },
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',

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
                ['<leader><M-a>'] = '@parameter.inner',
                ['<leader><M-f>'] = '@function.outer',
                ['<leader><M-e>'] = '@element',
            },
            swap_previous = {
                ['<leader><M-A>'] = '@parameter.inner',
                ['<leader><M-F>'] = '@function.outer',
                ['<leader><M-E>'] = '@element',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']f'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']F'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[F'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
    -- windwp/nvim-ts-autotag
    autotag = {
        enable = true,
    },
    -- nvim-treesitter/playground
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
    },
    -- nvim-treesitter/nvim-treesitter-refactor
    refactor = {
        highlight_definitions = { enable = true },
        -- highlight_current_scope = { enable = false },
    },
})
