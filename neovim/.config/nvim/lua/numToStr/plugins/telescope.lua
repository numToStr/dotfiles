local K = require('numToStr.keymap')
local actions = require('telescope.actions')
local A = vim.api

local function pmap(key)
    return function()
        A.nvim_feedkeys(A.nvim_replace_termcodes(key, true, false, true), 'ni', true)
    end
end

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
                ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
                ['<C-s>'] = actions.send_selected_to_qflist,
                ['<C-q>'] = actions.send_to_qflist,
                ['<C-w>'] = pmap('<C-S-W>'),
                ['<C-u>'] = pmap('<C-S-U>'),
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- "smart_case" | "ignore_case" | "respect_case"
        },
    },
})

_G.Telescope = setmetatable({}, {
    __index = function(_, k)
        if vim.bo.filetype == 'NvimTree' then
            A.nvim_command('wincmd l')
        end
        return require('telescope.builtin')[k]
    end,
})

-- Ctrl-p = fuzzy finder
K.n('<C-P>', '<CMD>lua Telescope.find_files({ hidden = true })<CR>')

-- Get :help at the speed of light
K.n('<leader>H', '<CMD>lua Telescope.help_tags()<CR>')

-- Fuzzy find active buffers
K.n("'b", '<CMD>lua Telescope.buffers()<CR>')

-- Search for string
K.n("'r", '<CMD>lua Telescope.live_grep()<CR>')

-- Fuzzy find changed files in git
K.n("'c", '<CMD>lua Telescope.git_status()<CR>')

-- Fuzzy find history buffers
-- U.map('n', "'i", "<CMD>lua __telescope_open('oldfiles')<CR>")
