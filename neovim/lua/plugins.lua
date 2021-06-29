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

            -- " Vim motion in lightning fast speed
            use {
                "phaazon/hop.nvim",
                config = require("plugins._hop").config
            }
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

            use "michaeljsmith/vim-indent-object"

            -- For floating terminal
            use {
                "numToStr/FTerm.nvim",
                config = require("plugins._term").config
            }

            -- For smooth scroll
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
                },
                {
                    "nvim-telescope/telescope-symbols.nvim"
                }
            }

            -- " For getting git status in the status line
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
