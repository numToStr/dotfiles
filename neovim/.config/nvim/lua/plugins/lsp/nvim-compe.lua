local M = {}

function M.config()
    local api = vim.api
    local fn = vim.fn
    local map = api.nvim_set_keymap
    local map_opts = { silent = true, expr = true }

    require('compe').setup({
        source = {
            -- builtin
            path = true,
            buffer = {
                menu = '[B]',
            },
            calc = true,
            -- lsp
            nvim_lsp = true,
            nvim_lua = {
                filetypes = { 'lua' },
            },
            -- snippets
            -- vsnip = true,
            -- ultisnips = true,
            luasnip = true,
        },
    })

    -- Enable completion keymappings
    map('i', '<C-Space>', 'compe#complete()', map_opts)
    map('i', '<CR>', [[compe#confirm(luaeval("require('nvim-autopairs').autopairs_cr()"))]], map_opts)
    map('i', '<C-e>', 'compe#close("<C-e>")', map_opts)
    map('i', '<C-f>', 'compe#close("<C-e>")', map_opts)
    map('i', '<C-d>', 'compe#scroll({ "delta": +4 })', map_opts)
    map('i', '<C-d>', 'compe#scroll({ "delta": -4 })', map_opts)

    -- Completion navigation
    local function term_code(str)
        return api.nvim_replace_termcodes(str, true, true, true)
    end

    function _G.__shift_tab()
        if fn.pumvisible() == 1 then
            return term_code('<C-p>')
        elseif fn['vsnip#jumpable'](-1) == 1 then
            return term_code('<Plug>(vsnip-jump-prev)')
        else
            -- If <S-Tab> is not working in your terminal, change it to <C-h>
            return term_code('<S-Tab>')
        end
    end

    function _G.__tab()
        local check_back_space = function()
            local col = fn.col('.') - 1
            return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        -- Use (s-)tab to:
        --- move to prev/next item in completion menuone
        --- jump to prev/next snippet's placeholder
        if fn.pumvisible() == 1 then
            return term_code('<C-n>')
        elseif fn['vsnip#available'](1) == 1 then
            return term_code('<Plug>(vsnip-expand-or-jump)')
        elseif check_back_space() then
            return term_code('<Tab>')
        else
            return fn['compe#complete']()
        end
    end

    map('i', '<Tab>', 'v:lua.__tab()', map_opts)
    map('s', '<Tab>', 'v:lua.__tab()', map_opts)
    map('i', '<S-Tab>', 'v:lua.__shift_tab()', map_opts)
    map('s', '<S-Tab>', 'v:lua.__shift_tab()', map_opts)
end

return M
