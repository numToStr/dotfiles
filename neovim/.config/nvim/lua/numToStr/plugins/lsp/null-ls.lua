local nls = require('null-ls')
local U = require('numToStr.plugins.lsp.utils')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

-- Configuring null-ls
nls.setup({
    sources = {
        -- # FORMATTING #
        fmt.trim_whitespace.with({
            filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux' },
        }),
        -- NOTE:
        -- 1. both needs to be enabled to so prettier can apply eslint fixes
        -- 2. prettierd should come first to prevent occassional race condition
        fmt.prettierd,
        fmt.eslint_d,
        -- fmt.prettier.with({
        --     extra_args = {
        --         '--tab-width=4',
        --         '--trailing-comma=es5',
        --         '--end-of-line=lf',
        --         '--arrow-parens=always',
        --     },
        -- }),
        fmt.rustfmt,
        fmt.stylua,
        fmt.terraform_fmt,
        fmt.gofmt,
        fmt.zigfmt,
        -- fmt.shfmt,
        -- # DIAGNOSTICS #
        dgn.eslint_d,
        dgn.shellcheck,
        dgn.luacheck.with({
            extra_args = { '--globals', 'vim', '--std', 'luajit' },
        }),
    },
    on_attach = function(client, bufnr)
        U.fmt_on_save(client)
        U.mappings(bufnr)
    end,
})
