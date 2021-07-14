local M = {}

function M.config()
    require('formatter').setup({
        logging = false,
        filetype = {
            terraform = {
                function()
                    return {
                        exe = 'terraform',
                        args = { 'fmt', '-' },
                        stdin = true,
                    }
                end,
            },
            lua = {
                function()
                    return {
                        exe = 'stylua',
                        args = { '-s', '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
                        stdin = false,
                        tempfile_dir = '/tmp',
                    }
                end,
            },
        },
    })
end

require('au').augroup('FormatAutogroup', {
    {
        event = 'BufWritePost',
        pattern = '*.tf,*.lua',
        command = 'FormatWrite',
    },
})

return M
