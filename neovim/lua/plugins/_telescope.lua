local U = require'utils'
local telescope = require'telescope.builtin'
local actions = require'telescope.actions'

require('telescope').setup({
    defaults = {
        prompt_position = 'top',
        prompt_prefix = ' ❯',
        sorting_strategy = 'ascending',
        mappings = {
            i = {
                ['<ESC>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-o>'] = function () do return end end,
                ['<TAB>'] = function () do return end end
            }
        },
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new
    }
})

U.highlights({
    TelescopePromptPrefix = { fg = 'MyWhite' },
    TelescopeMatching = { fg = 'tomato' },
})

function TelescopeOpen(fn)
    U.move_cursor_from_tree()
    telescope[fn]()
end

-- Ctrl-p = fuzzy finder
U.map("n", "<C-P>", "<CMD>lua TelescopeOpen('git_files')<CR>")

-- Fuzzy find active buffers
U.map("n", "'b", "<CMD>lua TelescopeOpen('buffers')<CR>")

-- Search for string
U.map("n", "'r", "<CMD>lua TelescopeOpen('live_grep')<CR>")

-- Fuzzy find history buffers
U.map("n", "'i", "<CMD>lua TelescopeOpen('oldfiles')<CR>")

-- Fuzzy find changed files in git
U.map("n", "'c", "<CMD>lua TelescopeOpen('git_status')<CR>")

-- Fuzzy find register
-- U.map("n", "'r", "<CMD>lua TelescopeOpen('registers')<CR>")
