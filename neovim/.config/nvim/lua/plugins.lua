local cmd = vim.api.nvim_command

local is_nvim_lsp = os.getenv('NVIM_LSP') == 'true'

-- Only required if you have packer in your `opt` pack
cmd([[packadd packer.nvim]])

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
require('au').augroup('PackerGroup', {
    {
        event = 'BufWritePost',
        pattern = 'plugins.lua',
        command = 'source <afile> | PackerCompile',
    },
})

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
            'numtostr/gruvbox-material',
            branch = 'lua',
            config = function()
                require('plugins.gruvbox')
            end,
        })

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        use({
            'shadmansaleh/lualine.nvim',
            event = 'BufEnter',
            config = function()
                require('plugins.lualine')
            end,
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
            'folke/todo-comments.nvim',
            event = 'BufRead',
            config = function()
                require('todo-comments').setup({
                    signs = false,
                })
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
            'tomtom/tcomment_vim',
            event = 'BufRead',
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
            'windwp/nvim-autopairs',
            event = 'InsertCharPre',
            config = function()
                require('nvim-autopairs').setup()
            end,
        })

        use({
            'ntpeters/vim-better-whitespace',
            event = 'BufRead',
            config = function()
                require('plugins.whitespace')
            end,
        })

        -- use({
        --     'bronson/vim-visual-star-search',
        --     event = 'BufRead',
        -- })

        use({
            'AndrewRadev/splitjoin.vim',
            -- NOTE: splitjoin won't work with `BufRead` event
            event = 'CursorHold',
        })

        use({
            'numtostr/BufOnly.nvim',
            event = 'BufRead',
            config = function()
                require('utils').map('n', '<leader>x', ':BufOnly<CR>')
            end,
        })

        use({
            'moll/vim-bbye',
            event = 'BufRead',
            config = function()
                require('utils').map('n', '<leader>q', ':Bdelete<CR>')
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

        use({
            'neoclide/coc.nvim',
            branch = 'release',
            event = 'BufRead',
            config = function()
                require('plugins.coc')
            end,
            disable = is_nvim_lsp,
            requires = {
                {
                    'dsznajder/vscode-es7-javascript-react-snippets',
                    run = 'yarn install --frozen-lockfile && yarn compile',
                    event = 'InsertCharPre',
                    disable = is_nvim_lsp,
                },
                {
                    'honza/vim-snippets',
                    event = 'InsertCharPre',
                    disable = is_nvim_lsp,
                },
            },
        })

        use({
            'neovim/nvim-lspconfig',
            event = 'BufRead',
            config = function()
                require('plugins.lsp.lsp-config')
            end,
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
                disable = not is_nvim_lsp,
                event = 'InsertEnter',
                config = function()
                    require('plugins.lsp.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'CursorHold',
                        config = function()
                            require('luasnip.loaders.from_vscode').lazy_load()
                        end,
                        requires = { 'rafamadriz/friendly-snippets' },
                    },
                },
            },
            {
                'hrsh7th/cmp-nvim-lsp',
                disable = not is_nvim_lsp,
                after = 'nvim-cmp',
            },
            {
                'abzcoding/cmp_luasnip',
                disable = not is_nvim_lsp,
                after = 'nvim-cmp',
            },
            {
                'hrsh7th/cmp-path',
                disable = not is_nvim_lsp,
                after = 'nvim-cmp',
            },
            {
                'hrsh7th/cmp-buffer',
                disable = not is_nvim_lsp,
                after = 'nvim-cmp',
            },
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
