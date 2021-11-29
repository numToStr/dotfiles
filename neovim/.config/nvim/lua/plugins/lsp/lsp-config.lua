local lsp = require('lspconfig')
local U = require('plugins.lsp.lsp-utils')

local capabilities = U.capabilities()
local flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 200,
}

-- Configuring native diagnostics
vim.diagnostic.config({
    virtual_text = {
        source = 'always',
    },
    float = {
        source = 'always',
    },
})

-- Lua
lsp.sumneko_lua.setup({
    cmd = { 'lua-language-server' },
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
    settings = {
        Lua = {
            completion = {
                enable = true,
                showWord = 'Disable',
                -- keywordSnippet = 'Disable',
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                path = U.get_luajit_path(),
            },
            diagnostics = {
                globals = { 'vim', 'dump' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = U.get_nvim_rtp_path(),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Rust
lsp.rust_analyzer.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                allFeatures = true,
                command = 'clippy',
            },
        },
    },
})

-- Zig
lsp.zls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
})

-- Golang
lsp.gopls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
})

-- Typescript
lsp.tsserver.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
})

-- TIP: Using `eslint_d` diagnostic from `null-ls` bcz it is way fasterrrrrrr.
-- Eslint
--[[ lsp.eslint.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
    settings = {
        useESLintClass = true, -- Recommended for eslint >= 7
        run = 'onSave', -- Run `eslint` after save
    },
    -- NOTE: `root_dir` is required to fix the monorepo issue
    root_dir = require('lspconfig.util').find_git_ancestor,
}) ]]

-- Json
lsp.jsonls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
})

-- YAML
lsp.yamlls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.disable_formatting(client)
        U.mappings(buf)
    end,
})
