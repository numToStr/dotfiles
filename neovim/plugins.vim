" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" FocusGained and FocusLost autocommand events are not working in terminal vim. This plugin restores them when using vim inside Tmux.
Plug 'tmux-plugins/vim-tmux-focus-events'

" IDK, but some useful stuff
" When searching with / , while on search
    " -> ctrl+g for jump to next
    " -> ctrl+t for jump to previous
Plug 'tpope/vim-sensible'

" For getting file icons in status-line, nerdtree etc.
" Note: Make sure you have installed ttf-nerd-fonts-symbols, if you manjaro just run `pamac install ttf-nerd-fonts-symbols`
Plug 'ryanoasis/vim-devicons'

" Declare the list of plugins.
" For geting the status line below
Plug 'vim-airline/vim-airline'

" For getting the theme
Plug 'numtostr/gruvbox-material'

" For getting indent lines in code
Plug 'yggdroot/indentline'

" For getting git status in the status line
Plug 'airblade/vim-gitgutter'

" For getting file explorer :NERDTree
Plug 'preservim/nerdtree'

" A plugin of NERDTree showing git status flags
Plug 'Xuyuanp/nerdtree-git-plugin'

" For commmenting stuff out
Plug 'tomtom/tcomment_vim'

" For navigating b/w tmux window, specially for navigating with NERDTree
Plug 'christoomey/vim-tmux-navigator'

" For 'surroundings': parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-surround'

" Fix repeat for vim-surround
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-fugitive'

" Vim motion in lightning fast speed
Plug 'easymotion/vim-easymotion'

" Intellisense and completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" For various text objects
Plug 'wellle/targets.vim'


" Enhanced syntax support
Plug 'sheerun/vim-polyglot'

" Fzf vim plugin. For this to work you need to install the fzf binary https://github.com/junegunn/fzf
" Plug 'junegunn/fzf.vim', { 'commit': '0fe8e19' }
Plug 'junegunn/fzf.vim'

" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'jiangmiao/auto-pairs'

" For highlighting trailing whitespace
" :StripWhitespace is also provided to clean whitespace automagically
Plug 'ntpeters/vim-better-whitespace'

" Delete buffers and close files in Vim without closing your windows or messing up your layout
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

Plug 'michaeljsmith/vim-indent-object'

Plug 'voldikss/vim-floaterm', { 'on': 'FloatermToggle' }

Plug 'psliwka/vim-smoothie'

Plug 'bronson/vim-visual-star-search'

" Safely deletes all open buffers except the current one and NERDTree
Plug 'numtostr/BufOnly.nvim', { 'on': 'BufOnly' }

" For showing the actual color of the hex value
Plug 'norcalli/nvim-colorizer.lua'

" For git stuff
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }

" Some snippets
Plug 'honza/vim-snippets'

Plug 'AndrewRadev/splitjoin.vim'

" For distraction free editing
" Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'kyazdani42/nvim-tree.lua'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
