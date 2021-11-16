local nls = require('null-ls')
local lsp_utils = require('plugins.lsp.lsp-utils')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

-- Configuring null-ls
nls.config({
    sources = {
        -- # FORMATTING #
        fmt.trim_whitespace.with({
            filetypes = { 'text', 'sh', 'zsh', 'yaml', 'toml', 'make', 'conf', 'tmux' },
        }),
        -- NOTE:
        -- 1. both needs to be enabled to so prettier can apply eslint fixes
        -- 2. and prettierd should come first
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
        -- # DIAGNOSTICS #
        dgn.eslint_d,
        dgn.luacheck,
        dgn.shellcheck,
    },
})

-- Setting up null-ls server
-- NOTE: don't move this setup() call elsewhere
require('lspconfig')['null-ls'].setup({
    on_attach = function(client, bufnr)
        lsp_utils.fmt_on_save(client)
        lsp_utils.mappings(bufnr)
    end,
})
