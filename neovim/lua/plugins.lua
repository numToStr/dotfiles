-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup({
    function()
        -- Packer can manage itself as an optional plugin
        use { 'wbthomason/packer.nvim', opt = true }

        -- " FocusGained and FocusLost autocommand events are not working in terminal vim. This plugin restores them when using vim inside Tmux.
        use 'tmux-plugins/vim-tmux-focus-events'

        -- " IDK, but some useful stuff
        -- " When searching with / , while on search
        --     " -> ctrl+g for jump to next
        --     " -> ctrl+t for jump to previous
        use 'tpope/vim-sensible'

        -- " For getting file icons in status-line, nerdtree etc.
        -- " Note: Make sure you have installed ttf-nerd-fonts-symbols, if you manjaro just run `pamac install ttf-nerd-fonts-symbols`
        use 'ryanoasis/vim-devicons'

        -- " Declare the list of plugins.
        -- " For geting the status line below
        use 'vim-airline/vim-airline'

        -- " For getting the theme
        use 'numtostr/gruvbox-material'

        -- " For getting indent lines in code
        use 'yggdroot/indentline'

        -- " For getting git status in the status line
        use 'airblade/vim-gitgutter'

        -- " For getting file explorer :NERDTree
        use 'preservim/nerdtree'

        -- " A plugin of NERDTree showing git status flags
        use 'Xuyuanp/nerdtree-git-plugin'

        -- " For commmenting stuff out
        use 'tomtom/tcomment_vim'

        -- " For navigating b/w tmux window, specially for navigating with NERDTree
        use 'christoomey/vim-tmux-navigator'

        -- " For 'surroundings': parentheses, brackets, quotes, XML tags, and more.
        use 'tpope/vim-surround'

        -- " Fix repeat for vim-surround
        use 'tpope/vim-repeat'

        use 'tpope/vim-fugitive'

        -- " Vim motion in lightning fast speed
        use 'easymotion/vim-easymotion'

        -- " Intellisense and completion engine
        use { 'neoclide/coc.nvim', branch = 'release' }
        use 'antoinemadec/coc-fzf'

        -- " For various text objects
        use 'wellle/targets.vim'

        -- " Enhanced syntax support
        use 'sheerun/vim-polyglot'

        -- " Fzf vim plugin. For this to work you need to install the fzf binary https://github.com/junegunn/fzf
        -- " use 'junegunn/fzf.vim', { 'commit': '0fe8e19' }
        use 'junegunn/fzf.vim'

        -- " Provides insert mode auto-completion for quotes, parens, brackets, etc.
        use 'jiangmiao/auto-pairs'

        -- " For highlighting trailing whitespace
        -- " :StripWhitespace is also provided to clean whitespace automagically
        use 'ntpeters/vim-better-whitespace'

        -- " Delete buffers and close files in Vim without closing your windows or messing up your layout
        use { 'moll/vim-bbye', cmd = 'Bdelete' }

        -- " A simple, easy-to-use Vim alignment plugin.
        use 'junegunn/vim-easy-align'

        use 'michaeljsmith/vim-indent-object'

        -- For floating terminal
        use 'numToStr/FTerm.nvim'

        -- For smooth scroll
        use 'psliwka/vim-smoothie'

        use 'bronson/vim-visual-star-search'

        -- " Safely deletes all open buffers except the current one and NERDTree
        use { 'numtostr/BufOnly.nvim', cmd = 'BufOnly' }

        -- " For showing the actual color of the hex value
        use 'norcalli/nvim-colorizer.lua'

        -- " For git stuff
        use { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' }

        -- " Some snippets
        use 'honza/vim-snippets'
        use { 'dsznajder/vscode-es7-javascript-react-snippets', run = 'yarn install --frozen-lockfile && yarn compile' }

        use 'AndrewRadev/splitjoin.vim'

        -- " For distraction free editing
        -- " use { 'junegunn/goyo.vim', cmd = 'Goyo' }

        -- " use 'kyazdani42/nvim-web-devicons'
        -- " use 'kyazdani42/nvim-tree.lua'
    end,
    config = {
        display = {
            open_fn = require"packer.util".float
        }
    }
})
