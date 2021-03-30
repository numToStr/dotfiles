local M = {}

function M.config()
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
end

require("au").augroup(
    "FormatAutogroup",
    {
        {
            event = "BufWritePost",
            pattern = "*.tf,*.lua",
            command = "FormatWrite"
        }
    }
)

return M
