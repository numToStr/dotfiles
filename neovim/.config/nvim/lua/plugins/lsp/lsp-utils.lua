local cmd = vim.api.nvim_command

local utils = {}

---Common format-on-save for lsp servers that implements formatting
---@param client table
function utils.fmt_on_save(client)
    -- Formatting on save
    if client.resolved_capabilities.document_formatting then
        cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

return utils
