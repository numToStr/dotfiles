local A = vim.api

local U = {}

-- Key mapping
function U.map(mode, key, result, opts)
    local options = { noremap = true, silent = true, expr = false }

    if opts then
        options = vim.tbl_extend('keep', opts, options)
    end

    A.nvim_set_keymap(mode, key, result, options)
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    if A.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
        A.nvim_command('wincmd l')
    end
end

return U
