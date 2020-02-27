" For Plugins to work, copy this file into
" [For vim] --> ~/.vimrc 
" [For neovim] --> ~/.config/nvim/init.vim 
"
" Generating config with GUI
" https://vimconfig.com

"  --- Required fonts ---
" powerline-fonts
" ttf-nerd-fonts-symbols

set nocompatible " Don't bother to be compatible with vi or something else
filetype off

" <C> = Ctrl
" <A> = Alt
" <S> = Shift
" <Leader> = \

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
" For code commenting; <Leader> = \, <Leader>cc
Plug 'preservim/nerdcommenter'
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
" For moving lines and selection up and down
Plug 'matze/vim-move'
" For getting file icons in status-line, nerdtree etc.
" Note: Make sure you have installed ttf-nerd-fonts-symbols, if you manjaro just run `pamac install ttf-nerd-fonts-symbols`
Plug 'ryanoasis/vim-devicons'
" Lightning fast left-right movement in Vim
Plug 'unblevable/quick-scope'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" For decorating tmux statusline
" Plug 'edkolev/tmuxline.vim'
" Live code playground like Quokka.js
" Plug 'metakirby5/codi.vim'

" TO BE EXPLORED
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'prettier/vim-prettier'
Plug 'easymotion/vim-easymotion'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme gruvbox 
syntax on " Enabling syntax highlighting
filetype plugin indent on " Enable inbuilt filetype plugin, helps NERDCommenter to aware of opened file for commenting

set encoding=UTF-8
set number
set showcmd
set termguicolors
set background=dark
set signcolumn=yes " always show signcolumns
set expandtab " always uses spaces instead of tab characters
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set numberwidth=6 " Width for the line number column
set scrolloff=5 " Display 5 lines above/below the cursor when scrolling with a mouse.
set ttyfast " Speed up scrolling in Vim
set wildmenu " Showing suggestion for tab completion
set hlsearch
set relativenumber

" Buffer specfic configs ==========

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the previous buffer
nmap <leader>h :bp<CR>
" Move to the next buffer
nmap <leader>l :bn<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" COC Config ===============================================================================================================
let g:coc_global_extensions = [    
    \ 'coc-tsserver',
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-snippets',
    \ 'coc-json',
    \ ]

" Airline ===============================================================================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tmuxline#enabled = 0

" Quick-Scope config ===============================================================================================================

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" For customizing colors
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

map <Space> <Plug>(easymotion-bd-w)

" Tmuxline config ===============================================================================================================
" let g:tmuxline_preset = {
"     \ 'a': '#S',
"     \ 'win': '#I:#W#F',
"     \ 'cwin': '#I:#W#F',
"     \ 'x': '%a',
"     \ 'y': ['%b %d', '%R'],
"     \ 'z': '#H',
"     \ 'options': {
"     \'status-justify': 'left'}
"     \}

" Fix: tmuxline not changing colors when mode changes https://github.com/edkolev/tmuxline.vim/issues/90
" if exists('$TMUX')
"     au InsertEnter * Tmuxline airline_insert
"     au InsertLeave * Tmuxline airline
" endif

" Gruvbox ===============================================================================================================
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'medium'

" IndentLine ===============================================================================================================
let g:indentLine_color_gui = '#a3a3a3'
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1

" NERDTree ===============================================================================================================

" For starting NERDTree on vim startup 
" autocmd vimenter * NERDTree

" For mapping ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" For opening a NERDTree automatically when vim starts up if no files were specified?
" Note: Now start vim with plain vim, not vim .
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" For starting NERDTree when vim is opened on a directory 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" For closing vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter ===============================================================================================================

" Remapping commenting to ctrl+m
map <C-m> <plug>NERDCommenterToggle

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" CtrlP ===============================================================================================================

" Set searching by filename (as opposed to full path)
let g:ctrlp_by_filename = 1

" Enable the lazy-update feature: only update the match window after typing's
" been stopped for a certain amount of time, 1 = 250ms
let g:ctrlp_lazy_update = 100

" How the newly created file is to be opened when pressing
" let g:ctrlp_open_new_file = 't' " In this case open in new tab

" This will open multiple selected file in a new tab
let g:ctrlp_open_multiple_files = 't'

" The nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
let g:ctrlp_working_path_mode = 'ra'

" The maximum depth of a directory tree to recurse into
let g:ctrlp_max_depth = 6

" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" For ignoring files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Set this to list of names to customize core types
" let g:ctrlp_types = ['fil', 'buf']

" Vim-Move ===============================================================================================================
" Modifying default modifier <A> Alt --> <S> Shift
" Note: Don't set it to <C>, if set it will conflict with vim-tmux-navigator
let g:move_key_modifier = 'S'

" Codi ScratchPad ===============================================================================================================

" For aligning output to the left
" Note: if you align right it will render ugly indent lines
" let g:codi#rightalign = 0
" Width for the output panel
" let g:codi#width = 50

