" Enabling syntax highlighting
syntax on
" Enable inbuilt filetype plugin, helps NERDCommenter to aware of opened file for commenting
filetype plugin indent on

set encoding=UTF-8
set number
set showcmd
set termguicolors
set background=dark
" always show signcolumns
set signcolumn=yes
" always uses spaces instead of tab characters
set expandtab
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
" Width for the line number column
set numberwidth=6
" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Speed up scrolling in Vim
set ttyfast
" Showing suggestion for tab completion
set wildmenu
set hlsearch
set relativenumber

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Auto save files when focus is lost
au FocusLost * :wa
au FocusLost * silent! wa

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
" nnoremap <SPACE> <Nop>
" let mapleader = ' '
" let g:mapleader = ' '
map <Space> <Leader>

" Disabling the default Shift-{j,k} key map
" These keys are used for easymotion navigation
map <S-k> <Nop>
map <S-j> <Nop>

" Only enable fzf shortkey when fzf binary is installed
if executable('fzf')
    nmap <leader>z :FZF<cr>
endif

" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the previous buffer
nmap <leader>[ :bp<CR>
" Move to the next buffer
nmap <leader>] :bn<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :Bdelete<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Quickly save document with \w
nmap <leader>w :w!<CR>
" Quickly quit vim
" Conflicting with <leader>qf in coc.vim
" nmap <leader>q :q<CR>
" Quickly remove search highlighting
nmap <leader>n :nohl<CR>
" To quickly add a blank line above/below and stay on normal mode
nmap <leader>o :normal o<CR>
nmap <leader>O :normal O<CR>

" Move line up and down => Ctrl+Shift+<key>
" Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
" Note:
" - Don't map with only Ctrl or Ctrl+Shift it will conflict with vim-tmux-navigator
" - Don't with only Shift, it will conflict with easymotion
" - Mapping with Ctrl+Alt doen't work on my terminal i.e Konsole
map <C-DOWN> :m .+1<CR>
map <C-UP> :m .-2<CR>
