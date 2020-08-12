" For starting NERDTree on vim startup
" autocmd vimenter * NERDTree

" For mapping ctrl+n to toggle NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

let g:NERDTreeMinimalMenu = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" These are spaces bcz the NERDTree is to close to side panel
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

" Don't show .git folder in the tree
let NERDTreeIgnore=['\.git$', '\.idea$']

" Auto delete open buffer when file is deleted
let NERDTreeAutoDeleteBuffer = 1

" For folder open/close icons
let g:DevIconsEnableFoldersOpenClose = 1

" To hide signcolumn in NERDTree
autocmd FileType tagbar,nerdtree setlocal signcolumn=no

" For opening a NERDTree automatically when vim starts up if no files were specified?
" Note: Now start vim with plain vim, not vim .
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" For starting NERDTree when vim is opened on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" For closing vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" sync open file with NERDTree
" Check if NERDTree is open or active
function! NERDTreeIsOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1) && g:NERDTree.IsOpen()
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! NERDTreeSync()
  if &modifiable && !&diff && NERDTreeIsOpen() && strlen(expand('%')) > 0 && bufname('%') !~# "^NERD_tree_"
    NERDTreeFind
    setlocal cursorline
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd bufenter * call NERDTreeSync()

" NERDTree git status plugin ==================================================

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'M',
    \ 'Staged'    :'A',
    \ 'Untracked' :'U',
    \ 'Renamed'   :'R',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'D',
    \ 'Dirty'     :'!',
    \ 'Ignored'   :'I',
    \ 'Clean'     :'C',
    \ 'Unknown'   :'?',
    \ }

" Indicate every single untracked file under an untracked dir
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
" To hide the boring brackets ([ ])
let g:NERDTreeGitStatusConcealBrackets = 0
