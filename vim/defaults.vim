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

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Disabling the default Shift-k key map
map <S-k> <Nop>

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
" Quickly save document with \w
map <leader>w :w<CR>
" Quickly quit vim
" Conflicting with <leader>qf in coc.vim
" nmap <leader>q :q<CR>
" Quickly remove search highlighting
map <leader>n :nohl<CR>
" To quickly add a blank line above/below and stay on normal mode
nmap <leader>o :normal o<CR>
nmap <leader>O :normal O<CR>

