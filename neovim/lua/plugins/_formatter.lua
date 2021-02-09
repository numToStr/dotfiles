require('formatter').setup({
    logging = false,
    filetype = {
        terraform = {
            function ()
                return {
                    exe = 'terraform',
                    args = { 'fmt', '-' },
                    stdin = true
                }
            end
        }
    }
})

vim.api.nvim_exec([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.tf FormatWrite
    augroup END
]], true)
