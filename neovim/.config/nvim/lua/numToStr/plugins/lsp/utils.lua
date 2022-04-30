local K = require('numToStr.keymap')

local U = {}

---Common format-on-save for lsp servers that implements formatting
---@param client table
function U.fmt_on_save(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('FORMATTING', { clear = true }),
            callback = function()
                -- increase timeout to 3 seconds
                vim.lsp.buf.formatting_sync(nil, 3000)
            end,
        })
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
    K.n.bmap(bufnr, 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    K.n.bmap(bufnr, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    K.n.bmap(bufnr, 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
    K.n.bmap(bufnr, 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    K.n.bmap(bufnr, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    K.i.bmap(bufnr, '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    -- K.n.bmap(bufnr, '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    -- K.n.bmap(bufnr, '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    -- K.n.bmap(bufnr, '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    -- K.n.bmap(bufnr, '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    K.n.bmap(bufnr, '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')
    K.n.bmap(bufnr, '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    -- K.v.bmap(bufnr, '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
    K.n.bmap(bufnr, '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
    K.n.bmap(bufnr, '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    K.n.bmap(bufnr, ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    -- K.n.bmap(bufnr, '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
    -- K.n.bmap(bufnr, '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
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
    return { os.getenv('VIMRUNTIME') }
    -- local result = {}
    -- for _, path in pairs(A.nvim_get_runtime_file('lua/', true)) do
    --     -- Don't load the `packer.nvim` path
    --     -- WARN: This is causing my local plugins to conflict with plugins loaded via packer.
    --     if not path:find('%.local/share') then
    --         result[path] = true
    --     end
    -- end
    -- return result
end

return U
