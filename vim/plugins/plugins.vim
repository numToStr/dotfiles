" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" For geting the status line below
Plug 'vim-airline/vim-airline'
" For getting the theme
Plug 'morhetz/gruvbox'
" For getting indent lines in code
Plug 'yggdroot/indentline'
" For getting git status in the status line
Plug 'airblade/vim-gitgutter'
" For getting file explorer :NERDTree
Plug 'scrooloose/nerdtree'
" A plugin of NERDTree showing git status flags
Plug 'Xuyuanp/nerdtree-git-plugin'
" For commenting stuff out
Plug 'tomtom/tcomment_vim'
" For searching files Press ctrl+p
Plug 'ctrlpvim/ctrlp.vim'
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
" For getting file icons in status-line, nerdtree etc.
" Note: Make sure you have installed ttf-nerd-fonts-symbols, if you manjaro just run `pamac install ttf-nerd-fonts-symbols`
Plug 'ryanoasis/vim-devicons'
" Lightning fast left-right movement in Vim
Plug 'unblevable/quick-scope'
" Vim motion on speed!
Plug 'easymotion/vim-easymotion'
" VS Code instellisense and autocompletion in vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" For decorating tmux statusline
" Plug 'edkolev/tmuxline.vim'
" Live code playground like Quokka.js
" Plug 'metakirby5/codi.vim'
" For code commenting; <Leader> = \, <Leader>cc
" Plug 'preservim/nerdcommenter'
" For moving lines and selection up and down
" Plug 'matze/vim-move'

" TO BE EXPLORED
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'prettier/vim-prettier'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
