local M = {}

function M.config()
    local g = vim.g

    g.indent_blankline_show_first_indent_level = false
    g.indent_blankline_filetype_exclude = {"help"}
    g.indent_blankline_buftype_exclude = {"terminal"}
end

return M
