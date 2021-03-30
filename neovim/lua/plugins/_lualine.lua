local M = {}

function M.config()
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
                {"filename", full_path = true, file_status = true},
                {"diagnostics", sources = {"coc"}}
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
        extensions = {}
    }
end

return M
