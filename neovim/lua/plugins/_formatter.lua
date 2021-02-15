require("formatter").setup(
    {
        logging = false,
        filetype = {
            terraform = {
                function()
                    return {
                        exe = "terraform",
                        args = {"fmt", "-"},
                        stdin = true
                    }
                end
            },
            lua = {
                -- install via: yarn global add lua-fmt
                function()
                    return {
                        exe = "luafmt",
                        args = {"--indent-count", 4, "--stdin"},
                        stdin = true
                    }
                end
            }
        }
    }
)

vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.tf,*.lua FormatWrite
    augroup END
]],
    true
)
