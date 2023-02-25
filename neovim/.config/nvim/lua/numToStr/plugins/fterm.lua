vim.keymap.set('n', '<A-i>', "<CMD>lua require('FTerm').toggle()<CR>")
vim.keymap.set('t', '<A-i>', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
vim.keymap.set('n', '<A-g>', function()
    require('FTerm')
        :new({
            cmd = { 'gitui' },
            dimensions = { height = 0.9, width = 0.9 },
        })
        :open()
end)

vim.keymap.set('n', '<C-e>', function()
    require('FTerm'):new({ cmd = { 'nnn' } }):open()
end)
