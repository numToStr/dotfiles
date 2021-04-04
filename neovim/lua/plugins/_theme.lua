local M = {}

function M.config()
    local g = vim.g

    g.gruvbox_material_background = "hard"
    g.gruvbox_material_sign_column_background = "none"
    -- g.gruvbox_material_transparent_background = 1
    g.gruvbox_material_better_performance = 1

    vim.api.nvim_command("colorscheme gruvbox-material")
end

require("au").augroup(
    "ColorSchemeOverrides",
    {
        {
            event = "ColorScheme",
            callback = function()
                local U = require("utils")

                local comment_fg = U.get_hl_color("Comment", "fg")
                local normal = U.get_hl_color("Normal", "both")

                local hop_hi = {bg = normal.fg, fg = normal.bg}
                local git_hi = {fg = normal.fg, gui = "bold"}

                U.highlights(
                    {
                        TelescopePromptPrefix = {fg = normal.fg},
                        TelescopeMatching = {fg = "Orange", gui = "bold"},
                        HopNextKey = hop_hi,
                        HopNextKey1 = hop_hi,
                        HopNextKey2 = hop_hi,
                        NvimTreeFolderName = {fg = normal.fg},
                        NvimTreeFolderIcon = {fg = normal.fg},
                        NvimTreeIndentMarker = {fg = comment_fg},
                        NvimTreeRootFolder = {fg = comment_fg, gui = "bold"},
                        NvimTreeGitDirty = git_hi,
                        NvimTreeGitStaged = git_hi,
                        NvimTreeGitMerge = git_hi,
                        NvimTreeGitNew = git_hi,
                        NvimTreeGitRenamed = git_hi,
                        NvimTreeGitDeleted = git_hi
                    }
                )
            end
        }
    }
)

return M
