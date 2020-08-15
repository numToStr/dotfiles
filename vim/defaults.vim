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

" For a better search experience
set ignorecase
set smartcase

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=150

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" For saving undo history, even if the file is closes
set undofile
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Auto save files when focus is lost
au FocusLost * :wa
au FocusLost * silent! wa

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" For Highlight current line
" only want the highlight applied in the current window
" Source: https://vim.fandom.com/wiki/Highlight_current_line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
nnoremap <SPACE> <Nop>
set timeoutlen=500
let g:mapleader = "\<Space>"
" map <Space> <Leader>

" Disabling the default Shift-{j,k} key map
" These keys are used for easymotion navigation
map <S-k> <Nop>
map <S-j> <Nop>

" To open a new empty buffer
nnoremap <silent> <leader>T :enew<cr>
" Move to the previous buffer
nnoremap <silent> <leader>[ :bp<CR>
" Move to the next buffer
nnoremap <silent> <leader>] :bn<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <silent> <leader>q :Bdelete<CR>
" Close all buffers except the current one
nnoremap <silent> <leader>x :BufOnly<CR>

" Copying the vscode behaviour of making tab splits
noremap <silent> <C-\> :vsplit<CR>

" Quickly exit vim
nnoremap <silent> <leader>Q :q<CR>
" Quickly save document with \w
nnoremap <silent> <leader>w :w!<CR>
" Quickly remove search highlighting
nnoremap <silent> <leader>n :nohl<CR>

" leader-d/D deletes blank line below/above
nnoremap <silent> <leader>d m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> <leader>D m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

" leader-o/O inserts blank line below/above
nnoremap <silent> <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Move line up and down => Ctrl+Shift+<key>
" Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
" Note:
" - Don't map with only Ctrl or Ctrl+Shift it will conflict with vim-tmux-navigator
" - Don't with only Shift, it will conflict with easymotion
" - Mapping with Ctrl+Alt doen't work on my terminal i.e Konsole
map <C-DOWN> :m .+1<CR>
map <C-UP> :m .-2<CR>
