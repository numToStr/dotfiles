local fn = vim.fn
local api = vim.api
local cmp = require('cmp')
local luasnip = require('luasnip')

local function t(str)
    return api.nvim_replace_termcodes(str, true, true, true)
end

local function check_back_space()
    local col = fn.col('.') - 1
    return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local function __tab(fallback)
    if fn.pumvisible() == 1 then
        fn.feedkeys(t('<C-n>'), 'n')
    elseif luasnip.expand_or_jumpable() then
        fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
    elseif check_back_space() then
        fn.feedkeys(t('<tab>'), 'n')
    else
        fallback()
    end
end

local function __shift_tab(fallback)
    if fn.pumvisible() == 1 then
        fn.feedkeys(t('<C-p>'), 'n')
    elseif luasnip.jumpable(-1) then
        fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
    else
        fallback()
    end
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ['<Tab>'] = cmp.mapping(__tab, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(__shift_tab, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
})
