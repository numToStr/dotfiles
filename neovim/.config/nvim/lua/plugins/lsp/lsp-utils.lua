local A = vim.api
local bmap = A.nvim_buf_set_keymap
local map_opt = { noremap = true, silent = true }

local U = {}

---Common format-on-save for lsp servers that implements formatting
---@param client table
function U.fmt_on_save(client)
    if client.resolved_capabilities.document_formatting then
        A.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

---LSP servers capabilities w/ nvim-cmp
function U.capabilities()
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    return require('cmp_nvim_lsp').update_capabilities(capabilities)
end

---Disable formatting for servers. Handles by null-ls
---@param client table
---@see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
function U.disable_formatting(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

---LSP mappings
---@param bufnr number
function U.mappings(bufnr)
    bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opt)
    bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opt)
    bmap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opt)
    bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opt)
    bmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opt)
    bmap(bufnr, 'i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opt)
    -- bmap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- bmap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- bmap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- bmap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    bmap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opt)
    bmap(bufnr, 'n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opt)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    bmap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', map_opt)
    bmap(bufnr, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', map_opt)
    bmap(bufnr, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', map_opt)
    -- bmap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- bmap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
end

---Make luajit runtime files discoverable to the server
function U.get_luajit_path()
    local luajit_path = vim.split(package.path, ';')
    table.insert(luajit_path, 'lua/?.lua')
    table.insert(luajit_path, 'lua/?/init.lua')
    return luajit_path
end

---Make neovim runtime files discoverable to the server
function U.get_nvim_rtp_path()
    local result = {}
    for _, path in pairs(A.nvim_get_runtime_file('lua/', true)) do
        -- Don't load the `packer.nvim` path
        -- WARN: This is causing my local plugins to conflict with plugins loaded via packer.
        if not path:find('%.local/share') then
            result[path] = true
        end
    end
    return result
end

return U
