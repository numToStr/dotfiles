" For starting NERDTree on vim startup
" autocmd vimenter * NERDTree

" For mapping ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowHidden = 1

" Don't show .git folder in the tree
let NERDTreeIgnore=['\.git$', '\.idea$']

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
