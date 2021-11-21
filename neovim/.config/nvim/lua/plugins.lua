-- Only required if you have packer in your `opt` pack
vim.api.nvim_command([[packadd packer.nvim]])

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
require('au2').group('PackerGroup', function(grp)
    grp.BufWritePost = { 'plugins.lua', 'source <afile> | PackerCompile' }
end)

return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use({ 'wbthomason/packer.nvim', opt = true })

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')

        ----------------------------------------
        -- Theme, Icons, Statusbar, Bufferbar --
        ----------------------------------------

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        use({
            'numToStr/Sakura.nvim',
            config = function()
                require('plugins.sakura')
            end,
        })

        use({
            {
                'nvim-lualine/lualine.nvim',
                after = 'Sakura.nvim',
                event = 'BufEnter',
                config = function()
                    require('plugins.lualine')
                end,
            },
            {
                'arkav/lualine-lsp-progress',
                after = 'lualine.nvim',
            },
        })

        use({
            'akinsho/bufferline.nvim',
            event = 'BufEnter',
            config = function()
                require('plugins.bufferline')
            end,
        })

        -----------------------------------
        -- Treesitter: Better Highlights --
        -----------------------------------

        use({
            {
                'nvim-treesitter/nvim-treesitter',
                event = 'CursorHold',
                run = ':TSUpdate',
                config = function()
                    require('plugins.treesitter')
                end,
            },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
            { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
        })

        --------------------------
        -- Editor UI Niceties --
        --------------------------

        use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.indentline')
            end,
        })

        use({
            'norcalli/nvim-colorizer.lua',
            event = 'CursorHold',
            config = function()
                require('colorizer').setup()
            end,
        })

        use({
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.gitsigns')
            end,
        })

        use({
            'rhysd/git-messenger.vim',
            event = 'BufRead',
            config = function()
                require('plugins.git-messenger')
            end,
        })

        ---------------------------------
        -- Navigation and Fuzzy Search --
        ---------------------------------

        use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('plugins.nvim-tree')
            end,
        })

        use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('plugins.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                after = 'telescope.nvim',
                run = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
        })

        use({
            'numtostr/Navigator.nvim',
            event = 'CursorHold',
            config = function()
                require('plugins.navigator')
            end,
        })

        use({
            'phaazon/hop.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.hop')
            end,
        })

        use({
            'karb94/neoscroll.nvim',
            event = 'WinScrolled',
            config = function()
                require('neoscroll').setup({ hide_cursor = false })
            end,
        })

        -------------------------
        -- Editing to the MOON --
        -------------------------

        use({
            '~/Documents/code/Comment.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.comment')
            end,
        })

        use({
            'tpope/vim-surround',
            event = 'BufRead',
            requires = {
                {
                    'tpope/vim-repeat',
                    event = 'BufRead',
                },
            },
        })

        use({
            'wellle/targets.vim',
            event = 'BufRead',
        })

        use({
            'ntpeters/vim-better-whitespace',
            event = 'BufRead',
            config = function()
                require('plugins.whitespace')
            end,
        })

        use({
            'AndrewRadev/splitjoin.vim',
            -- NOTE: splitjoin won't work with `BufRead` event
            event = 'CursorHold',
        })

        use({
            'numToStr/Buffers.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.buffers')
            end,
        })

        --------------
        -- Terminal --
        --------------

        use({
            'numToStr/FTerm.nvim',
            event = 'CursorHold',
            config = function()
                require('plugins.fterm')
            end,
        })

        -----------------------------------
        -- LSP, Completions and Snippets --
        -----------------------------------

        -- use({
        --     'neoclide/coc.nvim',
        --     branch = 'release',
        --     event = 'BufRead',
        --     config = function()
        --         require('plugins.coc')
        --     end,
        --     disable = is_nvim_lsp,
        --     requires = {
        --         {
        --             'dsznajder/vscode-es7-javascript-react-snippets',
        --             run = 'yarn install --frozen-lockfile && yarn compile',
        --             event = 'InsertCharPre',
        --             disable = is_nvim_lsp,
        --         },
        --         {
        --             'honza/vim-snippets',
        --             event = 'InsertCharPre',
        --             disable = is_nvim_lsp,
        --         },
        --     },
        -- })

        use({
            'neovim/nvim-lspconfig',
            event = 'BufRead',
            config = function()
                require('plugins.lsp.lsp-config')
            end,
            requires = {
                {
                    -- WARN: Unfortunately we won't be able to lazy load this
                    'hrsh7th/cmp-nvim-lsp',
                },
            },
        })

        use({
            'jose-elias-alvarez/null-ls.nvim',
            after = 'nvim-lspconfig',
            config = function()
                require('plugins.lsp.null-ls')
            end,
        })

        use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('plugins.lsp.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'CursorHold',
                        config = function()
                            require('plugins.lsp.luasnip')
                        end,
                        requires = { 'rafamadriz/friendly-snippets' },
                    },
                },
            },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        })

        -- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
        use({
            'windwp/nvim-autopairs',
            event = 'InsertCharPre',
            after = 'nvim-cmp',
            config = function()
                require('plugins.pairs')
            end,
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
