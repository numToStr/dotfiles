local A = vim.api

-- Custom filetypes
vim.filetype.add({
    extension = {
        conf = 'conf',
        mdx = 'markdown',
        mjml = 'html',
        kicad_mod = 'scheme',
    },
    pattern = {
        ['.*%.env.*'] = 'sh',
        ['ignore$'] = 'conf',
    },
    filename = {
        ['yup.lock'] = 'yaml',
    },
})

local num_au = A.nvim_create_augroup('NUMTOSTR', { clear = true })

-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual' })
        -- This is a workaround for clipboard not working in WSL
        -- see https://github.com/neovim/neovim/issues/19204#issuecomment-1173722375
        -- if vim.fn.has('wsl') == 1 then
        --     vim.fn.system('clip.exe', vim.fn.getreg('"'))
        -- end
    end,
})

-- Remove useless stuff from the terminal window and enter INSERT mode
A.nvim_create_autocmd('TermOpen', {
    group = num_au,
    callback = function(data)
        if not string.find(vim.bo[data.buf].filetype, '^[fF][tT]erm') then
            A.nvim_set_option_value('number', false, { scope = 'local' })
            A.nvim_set_option_value('relativenumber', false, { scope = 'local' })
            A.nvim_set_option_value('signcolumn', 'no', { scope = 'local' })
            A.nvim_command('startinsert')
        end
    end,
})

-- Jump to the last place in the file before exiting
A.nvim_create_autocmd('BufReadPost', {
    group = num_au,
    callback = function(data)
        local last_pos = A.nvim_buf_get_mark(data.buf, '"')
        if last_pos[1] > 0 and last_pos[1] <= A.nvim_buf_line_count(data.buf) then
            A.nvim_win_set_cursor(0, last_pos)
        end
    end,
})
