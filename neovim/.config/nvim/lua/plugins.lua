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
        -- ############################
        -- # Some requied Lua plugins #
        -- ############################
        use({
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        })

        -- Packer can manage itself as an optional plugin
        use({ 'wbthomason/packer.nvim', opt = true })

        -- For getting the theme
        use({
            'numtostr/gruvbox-material',
            branch = 'lua',
            config = function()
                require('plugins.gruvbox')
            end,
        })

        -- For getting indent lines in code
        use({
            'lukas-reineke/indent-blankline.nvim',
            event = { 'BufRead' },
            config = function()
                require('plugins.indentline')
            end,
        })

        -- For commmenting stuff out
        use({
            'tomtom/tcomment_vim',
            event = { 'BufRead' },
        })

        -- For navigating b/w tmux window, specially for navigating with NERDTree
        use({
            'numtostr/Navigator.nvim',
            event = { 'FocusLost', 'WinEnter' },
            config = function()
                require('plugins.navigator')
            end,
        })

        -- For 'surroundings': parentheses, brackets, quotes, XML tags, and more.
        use({
            'tpope/vim-surround',
            event = { 'BufRead' },
        })

        -- Fix repeat for vim-surround
        use({
            'tpope/vim-repeat',
            event = { 'BufRead' },
        })

        -- Vim motion in lightning fast speed
        use({
            'phaazon/hop.nvim',
            event = { 'BufRead' },
            config = function()
                require('plugins.hop')
            end,
        })

        -- Intellisense and completion engine
        use({
            'neoclide/coc.nvim',
            event = { 'BufRead' },
            config = function()
                require('plugins.coc')
            end,
            disable = is_nvim_lsp,
            requires = {
                {
                    'dsznajder/vscode-es7-javascript-react-snippets',
                    run = 'yarn install --frozen-lockfile && yarn compile',
                    event = { 'InsertCharPre' },
                    disable = is_nvim_lsp,
                },
                {
                    'honza/vim-snippets',
                    event = { 'InsertCharPre' },
                    disable = is_nvim_lsp,
                },
            },
        })

        -- For various text objects
        use({
            'wellle/targets.vim',
            event = { 'BufRead' },
        })

        -- Provides insert mode auto-completion for quotes, parens, brackets, etc.
        use({
            'windwp/nvim-autopairs',
            event = { 'InsertCharPre' },
            config = function()
                require('nvim-autopairs').setup()
            end,
        })

        -- For highlighting trailing whitespace
        -- :StripWhitespace is also provided to clean whitespace automagically
        use({
            'ntpeters/vim-better-whitespace',
            event = { 'BufRead' },
        })

        -- Delete buffers and close files in Vim without closing your windows or messing up your layout
        use({
            'moll/vim-bbye',
            event = { 'BufRead' },
            config = function()
                require('utils').map('n', '<leader>q', ':Bdelete<CR>')
            end,
        })

        use({
            'michaeljsmith/vim-indent-object',
            event = { 'BufRead' },
        })

        -- For floating terminal
        use({
            'numToStr/FTerm.nvim',
            event = { 'BufEnter' },
            config = function()
                require('plugins.fterm')
            end,
        })

        -- For smooth scroll
        use({
            'karb94/neoscroll.nvim',
            event = { 'WinScrolled' },
            config = function()
                require('neoscroll').setup({ hide_cursor = false })
            end,
        })

        use({
            'bronson/vim-visual-star-search',
            event = { 'BufRead' },
        })

        -- Safely deletes all open buffers except the current one and NERDTree
        use({
            'numtostr/BufOnly.nvim',
            event = { 'BufRead' },
            config = function()
                require('utils').map('n', '<leader>x', ':BufOnly<CR>')
            end,
        })

        -- For showing the actual color of the hex value
        use({
            'norcalli/nvim-colorizer.lua',
            event = { 'BufEnter' },
            config = function()
                require('colorizer').setup()
            end,
        })

        -- For git stuff
        use({
            'rhysd/git-messenger.vim',
            event = { 'BufRead' },
            config = function()
                require('plugins.git-messenger')
            end,
        })

        use({
            'AndrewRadev/splitjoin.vim',
            event = { 'BufRead' },
        })

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        use({
            'kyazdani42/nvim-tree.lua',
            event = { 'VimEnter' },
            config = function()
                require('plugins.nvim-tree')
            end,
        })

        use({
            {
                'nvim-telescope/telescope.nvim',
                config = function()
                    require('plugins.telescope')
                end,
            },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'nvim-telescope/telescope-symbols.nvim' },
        })

        -- For getting git status in the status line
        use({
            'lewis6991/gitsigns.nvim',
            event = { 'BufRead' },
            config = function()
                require('plugins.gitsigns')
            end,
        })

        -- To format stuff out
        use({
            'mhartington/formatter.nvim',
            event = { 'BufRead' },
            config = function()
                require('plugins.formatter')
            end,
        })

        use({
            'hoob3rt/lualine.nvim',
            config = function()
                require('plugins.lualine')
            end,
        })

        use({
            'akinsho/nvim-bufferline.lua',
            config = function()
                require('plugins.bufferline')
            end,
        })

        use({
            {
                'nvim-treesitter/nvim-treesitter',
                event = { 'BufRead' },
                run = ':TSUpdate',
                config = function()
                    require('plugins.treesitter')
                end,
            },
            { 'nvim-treesitter/playground', event = { 'BufRead' } },
            { 'nvim-treesitter/nvim-treesitter-textobjects', event = { 'BufRead' } },
            { 'nvim-treesitter/nvim-treesitter-refactor', event = { 'BufRead' } },
            { 'windwp/nvim-ts-autotag', event = { 'BufRead' } },
        })

        use({
            'folke/todo-comments.nvim',
            event = { 'BufRead' },
            config = function()
                require('todo-comments').setup({
                    signs = false,
                })
            end,
        })

        -- ##############
        -- # Neovim LSP #
        -- ##############

        -- For autocompletion
        use({
            'hrsh7th/nvim-compe',
            disable = not is_nvim_lsp,
            event = 'InsertEnter',
            config = function()
                require('plugins.lsp.nvim-compe')
            end,
            requires = {
                -- For snippets support
                {
                    'L3MON4D3/LuaSnip',
                    event = 'InsertCharPre',
                },
            },
        })
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        },
    },
})
