require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        changedelete = { text = '=' },
    },
    on_attach = function(buf)
        local map = vim.keymap.set

        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<CMD>Gitsigns next_hunk<CR>'", { buffer = buf, expr = true })
        map('n', '[c', "&diff ? '[c' : '<CMD>Gitsigns prev_hunk<CR>'", { buffer = buf, expr = true })

        -- Actions
        map({ 'n', 'v' }, '<leader>hr', '<CMD>Gitsigns reset_hunk<CR>', { buffer = buf })
        map('n', '<leader>hp', '<CMD>Gitsigns preview_hunk<CR>', { buffer = buf })
        map('n', '<leader>hS', '<CMD>Gitsigns stage_buffer<CR>', { buffer = buf })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = buf })
    end,
})
