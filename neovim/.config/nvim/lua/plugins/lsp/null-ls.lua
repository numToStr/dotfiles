local nls = require('null-ls')

local fmt = nls.builtins.formatting

-- Configuring null-ls
nls.config({
    sources = {
        fmt.trim_whitespace.with({
            filetypes = { 'text', 'sh', 'zsh', 'yaml', 'toml', 'make', 'conf', 'tmux' },
        }),
        fmt.rustfmt,
        fmt.stylua,
        fmt.terraform_fmt,
        fmt.gofmt,
        fmt.zigfmt, -- PR #278
    },
})

-- Setting up null-ls server
-- NOTE: don't move this setup() call elsewhere
require('lspconfig')['null-ls'].setup({
    on_attach = function(client)
        require('plugins.lsp.lsp-utils').fmt_on_save(client)
    end,
})
