local M = {}

function M.config()
    -- local U = require "utils"
    local g = vim.g

    g.gruvbox_material_background = "hard"
    g.gruvbox_material_sign_column_background = "none"
    -- g.gruvbox_material_transparent_background = 1
    g.gruvbox_material_better_performance = 1

    vim.api.nvim_command("colorscheme gruvbox-material")

    -- These colors are used in fzf markers
    -- And should be called after colorscheme command
    -- U.highlights(
    --     {
    --         MyWhite = {fg = "#ffffff"},
    --         MyBlack = {fg = "#1c1c1c"}
    --     }
    -- )
end

require("au").augroup(
    "ColorSchemeOverrides",
    {
        {
            event = "ColorScheme",
            callback = function()
                local U = require("utils")

                local comment_fg = U.get_hl_color("Comment", "fg")
                local normal_fg = U.get_hl_color("Normal", "fg")
                local normal_bg = U.get_hl_color("Normal", "bg")

                local hop_hi = {
                    bg = normal_fg,
                    fg = normal_bg
                }

                U.highlights(
                    {
                        TelescopePromptPrefix = {fg = normal_fg},
                        TelescopeMatching = {fg = "Orange", gui = "bold"},
                        HopNextKey = hop_hi,
                        HopNextKey1 = hop_hi,
                        HopNextKey2 = hop_hi,
                        NvimTreeFolderName = {fg = normal_fg},
                        NvimTreeFolderIcon = {fg = normal_fg},
                        NvimTreeIndentMarker = {fg = comment_fg}
                        -- NvimTreeFileDirty = {fg = "None"},
                        -- NvimTreeFileStaged = {fg = "None"},
                        -- NvimTreeFileMerge = {fg = "None"},
                        -- NvimTreeFileNew = {fg = "None"},
                        -- NvimTreeFileRenamed = {fg = "None"}
                    }
                )
            end
        }
    }
)

return M
