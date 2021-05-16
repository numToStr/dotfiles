local cmd = vim.api.nvim_command

-- Only required if you have packer in your `opt` pack
cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
require("au").augroup(
    "PackerGroup",
    {
        {
            event = "BufWritePost",
            pattern = "plugins.lua",
            command = "PackerCompile"
        }
    }
)

return require("packer").startup(
    {
        function(use)
            -- ############################
            -- # Some requied Lua plugins #
            -- ############################
            use {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim"
            }

            -- Packer can manage itself as an optional plugin
            use {"wbthomason/packer.nvim", opt = true}

            -- " IDK, but some useful stuff
            -- " When searching with / , while on search
            --     " -> ctrl+g for jump to next
            --     " -> ctrl+t for jump to previous
            -- use "tpope/vim-sensible"

            -- " For getting file icons in status-line, nerdtree etc.
            -- " Note: Make sure you have installed ttf-nerd-fonts-symbols, if you manjaro just run `pamac install ttf-nerd-fonts-symbols`
            -- use "ryanoasis/vim-devicons"

            -- " Declare the list of plugins.
            -- " For geting the status line below
            -- use "vim-airline/vim-airline"

            -- " For getting the theme
            use {
                "numtostr/gruvbox-material",
                branch = "lua",
                config = require("plugins._theme").config
            }

            -- " For getting indent lines in code
            use {
                "lukas-reineke/indent-blankline.nvim",
                branch = "lua",
                config = require("plugins._indentline").config
            }

            -- " For getting file explorer :NERDTree
            -- use {
            --     {
            --         "preservim/nerdtree",
            --         config = require("plugins._nerdtree").config
            --     },
            --     -- A plugin of NERDTree showing git status flags
            --     "Xuyuanp/nerdtree-git-plugin"
            -- }

            -- " For commmenting stuff out
            use "tomtom/tcomment_vim"

            -- " For navigating b/w tmux window, specially for navigating with NERDTree
            use {
                "numtostr/Navigator.nvim",
                config = require("plugins._navigator").config
            }

            -- " For 'surroundings': parentheses, brackets, quotes, XML tags, and more.
            use "tpope/vim-surround"

            -- " Fix repeat for vim-surround
            use "tpope/vim-repeat"

            -- use "tpope/vim-fugitive"

            -- " Vim motion in lightning fast speed
            use {
                "phaazon/hop.nvim",
                config = require("plugins._hop").config
            }
            -- use {
            --     "easymotion/vim-easymotion",
            --     config = require("plugins._easymotion").config
            -- }

            -- " Intellisense and completion engine
            use {
                {
                    "neoclide/coc.nvim",
                    branch = "release",
                    config = require("plugins._coc").config
                },
                -- This plugins only works with coc.nvim
                {
                    "dsznajder/vscode-es7-javascript-react-snippets",
                    run = "yarn install --frozen-lockfile && yarn compile"
                }
            }

            -- " For various text objects
            use "wellle/targets.vim"

            -- " Enhanced syntax support
            -- use "sheerun/vim-polyglot"

            -- " Fzf vim plugin. For this to work you need to install the fzf binary https://github.com/junegunn/fzf
            -- " use 'junegunn/fzf.vim', { 'commit': '0fe8e19' }
            -- use 'junegunn/fzf.vim'

            -- " Provides insert mode auto-completion for quotes, parens, brackets, etc.
            use {
                "windwp/nvim-autopairs",
                config = function()
                    require("nvim-autopairs").setup()
                end
            }

            -- " For highlighting trailing whitespace
            -- " :StripWhitespace is also provided to clean whitespace automagically
            use "ntpeters/vim-better-whitespace"

            -- " Delete buffers and close files in Vim without closing your windows or messing up your layout
            use {
                "moll/vim-bbye",
                config = function()
                    require("utils").map("n", "<leader>q", ":Bdelete<CR>")
                end
            }

            -- " A simple, easy-to-use Vim alignment plugin.
            -- use 'junegunn/vim-easy-align'

            use "michaeljsmith/vim-indent-object"

            -- For floating terminal
            use {
                "numToStr/FTerm.nvim",
                config = require("plugins._term").config
            }

            -- For smooth scroll
            -- use "psliwka/vim-smoothie"
            use {
                "karb94/neoscroll.nvim",
                config = function()
                    require("neoscroll").setup({hide_cursor = false})
                end
            }

            use "bronson/vim-visual-star-search"

            -- " Safely deletes all open buffers except the current one and NERDTree
            use {
                "numtostr/BufOnly.nvim",
                config = function()
                    require("utils").map("n", "<leader>x", ":BufOnly<CR>")
                end
            }

            -- " For showing the actual color of the hex value
            use {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require "colorizer".setup()
                end
            }

            -- " For git stuff
            use {
                "rhysd/git-messenger.vim",
                config = require("plugins._git-messenger").config
            }

            -- " Some snippets
            use "honza/vim-snippets"

            use "AndrewRadev/splitjoin.vim"

            -- " For distraction free editing
            -- " use { 'junegunn/goyo.vim', cmd = 'Goyo' }

            use {
                "kyazdani42/nvim-web-devicons",
                config = function()
                    require "nvim-web-devicons".setup()
                end
            }

            use {
                "kyazdani42/nvim-tree.lua",
                config = require "plugins._tree".config
            }

            use {
                {
                    "nvim-telescope/telescope.nvim",
                    config = require("plugins._telescope").config
                },
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    run = "make"
                }
                -- {
                --     "nvim-telescope/telescope-fzy-native.nvim",
                --     requires = {"romgrk/fzy-lua-native"}
                -- }
            }

            -- " For getting git status in the status line
            -- use 'airblade/vim-gitgutter'
            use {
                "lewis6991/gitsigns.nvim",
                config = require("plugins._gitsigns").config
            }

            -- To format stuff out
            use {
                "mhartington/formatter.nvim",
                config = require("plugins._formatter").config
            }

            use {
                "hoob3rt/lualine.nvim",
                config = require "plugins._lualine".config
            }

            use {
                "akinsho/nvim-bufferline.lua",
                config = require "plugins._bufferline".config
            }

            use {
                {
                    "nvim-treesitter/nvim-treesitter",
                    run = ":TSUpdate",
                    config = require("plugins._treesitter").config
                },
                "nvim-treesitter/playground",
                "nvim-treesitter/nvim-treesitter-textobjects",
                "windwp/nvim-ts-autotag"
            }

            -- After removing polyglot some filetypes got messed up and doesn't have treesitter support
            -- So, I need to fix them by intalling there syntax file individually
            use "hashivim/vim-terraform" -- for terraform
        end,
        config = {
            display = {
                open_fn = require "packer.util".float
            }
        }
    }
)
