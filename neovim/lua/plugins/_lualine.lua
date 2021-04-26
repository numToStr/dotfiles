local M = {}

function M.config()
    local U = require("utils")

    local err = U.get_hl_color("ErrorMsg", "fg")
    local warn = U.get_hl_color("WarningMsg", "fg")

    require("lualine").setup {
        options = {
            theme = "gruvbox_material",
            component_separators = "",
            icons_enabled = true
        },
        sections = {
            lualine_a = {
                {"mode", upper = true, color = {gui = "bold"}}
            },
            lualine_b = {
                {"branch"},
                {"diff", colored = false}
            },
            lualine_c = {
                {"filename", file_status = true},
                {
                    "diagnostics",
                    sources = {"coc"},
                    color_error = err,
                    color_warn = warn
                }
            },
            lualine_x = {
                "g:coc_status",
                "filetype",
                "encoding",
                "fileformat"
            },
            lualine_y = {"progress"},
            lualine_z = {
                {"location", color = {gui = "bold"}}
            }
        },
        extensions = {"nvim-tree"}
    }
end

return M
