local lsconf = require('lspconfig')
local lsp_utils = require('plugins.lsp.lsp-utils')

local capabilities = lsp_utils.capabilities()
local flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 200,
}

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

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
lsconf.sumneko_lua.setup({
    cmd = { 'lua-language-server' },
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        lsp_utils.disable_formatting(client)
        lsp_utils.mappings(buf)
    end,
    settings = {
        Lua = {
            completion = {
                enable = true,
                showWord = 'Disable',
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Rust
lsconf.rust_analyzer.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        lsp_utils.disable_formatting(client)
        lsp_utils.mappings(buf)
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
lsconf.zls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        lsp_utils.disable_formatting(client)
        lsp_utils.mappings(buf)
    end,
})

-- Golang
lsconf.gopls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        lsp_utils.disable_formatting(client)
        lsp_utils.mappings(buf)
    end,
})

-- Typescript
lsconf.tsserver.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        lsp_utils.disable_formatting(client)
        lsp_utils.mappings(buf)
    end,
})

-- BUG: Sending false errors. It seems to be a `root_dir` issue. Therefore, using `null-ls` for now.
-- Eslint
-- lsconf.eslint.setup({
--     flags = flags,
--     capabilities = capabilities,
--     on_attach = function(client)
--         lsp_utils.disable_formatting(client)
--     end,
--     settings = {
--         useESLintClass = true, -- Recommended for eslint >= 7
--         packageManager = 'yarn', -- I use `yarn` btw
--         -- run = 'onSave', -- Run `eslint` after save
--     },
-- })

-- Json
lsconf.jsonls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        lsp_utils.disable_formatting(client)
        lsp_utils.mappings(buf)
    end,
})

-- YAML
lsconf.yamlls.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        lsp_utils.disable_formatting(client)
        lsp_utils.mappings(buf)
    end,
})
