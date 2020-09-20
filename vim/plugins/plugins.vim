" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" FocusGained and FocusLost autocommand events are not working in terminal vim. This plugin restores them when using vim inside Tmux.
Plug 'tmux-plugins/vim-tmux-focus-events'

" For getting file icons in status-line, nerdtree etc.
" Note: Make sure you have installed ttf-nerd-fonts-symbols, if you manjaro just run `pamac install ttf-nerd-fonts-symbols`
Plug 'ryanoasis/vim-devicons'

" For geting the status line below
Plug 'vim-airline/vim-airline'

" For getting the theme
" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
Plug 'numtostr/gruvbox-material'

" For getting indent lines in code
Plug 'yggdroot/indentline'

" For getting git status in the status line
Plug 'airblade/vim-gitgutter'

" For getting file explorer :NERDTree
Plug 'preservim/nerdtree'

" A plugin of NERDTree showing git status flags
Plug 'Xuyuanp/nerdtree-git-plugin'

" For commenting stuff out
Plug 'tomtom/tcomment_vim'

" For navigating b/w tmux window, specially for navigating with NERDTree
Plug 'christoomey/vim-tmux-navigator'

" IDK, but some useful stuff
" When searching with / , while on search
    " -> ctrl+g for jump to next
    " -> ctrl+t for jump to previous
Plug 'tpope/vim-sensible'

" For providing git integration
Plug 'tpope/vim-fugitive'

" For 'surroundings': parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-surround'

" Fix repeat for vim-surround
Plug 'tpope/vim-repeat'

" Vim motion on speed!
Plug 'easymotion/vim-easymotion'

" VS Code instellisense and autocompletion in vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For various text objects
Plug 'wellle/targets.vim'

" For distraction free editing
Plug 'junegunn/goyo.vim'

" Enhanced syntax support
Plug 'sheerun/vim-polyglot'

" Making yarn highlight
Plug 'machakann/vim-highlightedyank'

" Fzf vim plugin. For this to work you need to install the fzf binary https://github.com/junegunn/fzf
" Only install in fzf is available on the system
Plug 'junegunn/fzf.vim'

" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'jiangmiao/auto-pairs'

" For highlighting trailing whitespace
" :StripWhitespace is also provided to clean whitespace automagically
Plug 'ntpeters/vim-better-whitespace'

" Delete buffers and close files in Vim without closing your windows or messing up your layout
Plug 'moll/vim-bbye'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

" Support for indent text object, useful for yaml, bash etc.
Plug 'michaeljsmith/vim-indent-object'

" For floating terminal support, kinda like vscode
Plug 'voldikss/vim-floaterm'

" For smooth scrolling like a smoothie
Plug 'psliwka/vim-smoothie'

" Seach with * and # in visual mode
Plug 'bronson/vim-visual-star-search'

" Safely deletes all open buffers except the current one and NERDTree
Plug 'vim-scripts/BufOnly.vim'

" For showing the actual color of the hex value
Plug 'ap/vim-css-color'

" Some snippets
Plug 'honza/vim-snippets'


" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" For decorating tmux statusline
" Plug 'edkolev/tmuxline.vim'

" For searching files Press ctrl+p
" Plug 'ctrlpvim/ctrlp.vim'

" Live code playground like Quokka.js
" Plug 'metakirby5/codi.vim'

" For code commenting; <Leader> = \, <Leader>cc
" Plug 'preservim/nerdcommenter'

" For moving lines and selection up and down
" Plug 'matze/vim-move'

" Lightning fast left-right movement in Vim
" Plug 'unblevable/quick-scope'

" TO BE EXPLORED
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'prettier/vim-prettier'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
