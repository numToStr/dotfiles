local M = {}

function M.config()
    require "bufferline".setup(
        {
            show_buffer_close_icons = false,
            show_close_icon = false,
            enforce_regular_tabs = true,
            max_prefix_length = 10
        }
    )
end

return M
