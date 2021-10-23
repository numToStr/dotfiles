local lsconf = require('lspconfig')
local lsp_utils = require('plugins.lsp.lsp-utils')

local capabilities = lsp_utils.capabilities()

-- Lua
lsconf.sumneko_lua.setup({
    cmd = { 'lua-language-server' },
    capabilities = capabilities,
    on_attach = function(client)
        lsp_utils.disable_formatting(client)
    end,
    settings = {
        Lua = {
            completion = {},
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
        },
    },
})

-- Rust
lsconf.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = function(client)
        lsp_utils.disable_formatting(client)
    end,
})

-- Zig
lsconf.zls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        lsp_utils.disable_formatting(client)
    end,
})

-- Golang
lsconf.gopls.setup({
    capabilities = capabilities,
    on_attach = function(client)
        lsp_utils.disable_formatting(client)
    end,
})
