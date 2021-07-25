local U = require('utils')
local finders = require('telescope.builtin')
local actions = require('telescope.actions')
-- local sorters = require "telescope.sorters"

require('telescope').setup({
    defaults = {
        prompt_prefix = ' ❯ ',
        initial_mode = 'insert',
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top',
        },
        mappings = {
            i = {
                ['<ESC>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-o>'] = function()
                    return
                end,
                ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
                ['<C-s>'] = actions.send_selected_to_qflist,
                ['<C-q>'] = actions.send_to_qflist,
            },
        },
        -- file_sorter = sorters.get_fzy_sorter,
        -- generic_sorter = sorters.get_fzy_sorter
    },
    extensions = {
        fzf = {
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- "smart_case" | "ignore_case" | "respect_case"
        },
        -- fzy_native = {
        --     override_file_sorter = true,
        --     override_generic_sorter = true
        -- }
    },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
-- require("telescope").load_extension("fzy_native")

function TelescopeOpen(fn)
    U.move_cursor_from_tree()
    finders[fn]({
        hidden = true,
    })
end

-- Ctrl-p = fuzzy finder
U.map('n', '<C-P>', "<CMD>lua TelescopeOpen('find_files')<CR>")

-- Fuzzy find active buffers
U.map('n', "'b", "<CMD>lua TelescopeOpen('buffers')<CR>")

-- Search for string
U.map('n', "'r", "<CMD>lua TelescopeOpen('live_grep')<CR>")

-- Fuzzy find history buffers
U.map('n', "'i", "<CMD>lua TelescopeOpen('oldfiles')<CR>")

-- Fuzzy find changed files in git
U.map('n', "'c", "<CMD>lua TelescopeOpen('git_status')<CR>")

-- Fuzzy find register
U.map('n', "'g", "<CMD>lua TelescopeOpen('registers')<CR>")
