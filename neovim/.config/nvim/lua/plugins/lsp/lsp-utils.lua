local U = {}

---Common format-on-save for lsp servers that implements formatting
---@param client table
function U.fmt_on_save(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
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
---@source https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
function U.disable_formatting(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

return U
