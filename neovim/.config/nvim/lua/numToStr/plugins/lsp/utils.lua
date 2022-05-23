local K = require('numToStr.keymap')

local U = {}

local fmt_group = vim.api.nvim_create_augroup('FORMATTING', { clear = true })

---Common format-on-save for lsp servers that implements formatting
---@param client table
---@param buf integer
function U.fmt_on_save(client, buf)
    if client.supports_method('textDocument/formatting') then
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = fmt_group,
            buffer = buf,
            callback = function()
                vim.lsp.buf.format({
                    timeout_ms = 3000,
                    buffer = buf,
                })
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

return U
