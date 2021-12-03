-- Only required if you have packer in your `opt` pack
vim.api.nvim_command([[packadd packer.nvim]])

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
require('numToStr.au').group('PackerGroup', function(grp)
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
                require('numToStr.plugins.sakura')
            end,
        })

        use({
            {
                'nvim-lualine/lualine.nvim',
                after = 'Sakura.nvim',
                event = 'BufEnter',
                config = function()
                    require('numToStr.plugins.lualine')
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
                require('numToStr.plugins.bufferline')
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
                    require('numToStr.plugins.treesitter')
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
                require('numToStr.plugins.indentline')
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
                require('numToStr.plugins.gitsigns')
            end,
        })

        use({
            'rhysd/git-messenger.vim',
            event = 'BufRead',
            config = function()
                require('numToStr.plugins.git-messenger')
            end,
        })

        ---------------------------------
        -- Navigation and Fuzzy Search --
        ---------------------------------

        use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('numToStr.plugins.nvim-tree')
            end,
        })

        use({
            {
                '~/Documents/code/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('numToStr.plugins.telescope')
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
            'numToStr/Navigator.nvim',
            event = 'CursorHold',
            config = function()
                require('numToStr.plugins.navigator')
            end,
        })

        use({
            'phaazon/hop.nvim',
            event = 'BufRead',
            config = function()
                require('numToStr.plugins.hop')
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
            'numToStr/Comment.nvim',
            event = 'BufRead',
            config = function()
                require('numToStr.plugins.comment')
            end,
        })

        -- use({
        --     '~/Documents/code/Surround.nvim',
        --     event = 'BufRead',
        --     config = function()
        --         require('Surround').setup()
        --     end,
        -- })

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
                require('numToStr.plugins.whitespace')
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
                require('numToStr.plugins.buffers')
            end,
        })

        --------------
        -- Terminal --
        --------------

        use({
            'numToStr/FTerm.nvim',
            event = 'CursorHold',
            config = function()
                require('numToStr.plugins.fterm')
            end,
        })

        -----------------------------------
        -- LSP, Completions and Snippets --
        -----------------------------------

        use({
            'neovim/nvim-lspconfig',
            event = 'BufRead',
            config = function()
                require('numToStr.plugins.lsp.servers')
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
                require('numToStr.plugins.lsp.null-ls')
            end,
        })

        use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('numToStr.plugins.lsp.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'CursorHold',
                        config = function()
                            require('numToStr.plugins.lsp.luasnip')
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
                require('numToStr.plugins.pairs')
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
