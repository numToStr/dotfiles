let $FZF_DEFAULT_OPTS='--color=dark --layout=reverse --margin=1,1'

let $FZF_DEFAULT_COMMAND='git ls-files --cached --others --exclude-standard || fd --type f --type l --hidden --follow'

let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Red'],
      \ 'fg+':     ['fg', 'White'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'Red'],
      \ 'info':    ['bg', 'Normal'],
      \ 'prompt':  ['bg', 'BGffffff'],
      \ 'pointer': ['bg', 'BGffffff'],
      \ 'marker':  ['fg', 'Yellow'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header':  ['bg', 'Normal']
      \ }

" This will not consider .gitignore while searching
" this will make .eslintrc,.prettierrc to show in search
" But will take consider .fdignore file
" let $FZF_DEFAULT_COMMAND='fd --type f --type l --hidden --follow --no-ignore-vcs'

" Changing the prompt for the :Files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, { 'options': "--prompt '⯈ '"}, <bang>0)

" Open fzf in a floating window
let g:fzf_layout = { 'window': { 'width': 0.4, 'height': 0.25, 'yoffset': 0 } }

" Don't open preview window while searching
" let g:fzf_preview_window = 'right:60%'
let g:fzf_preview_window = ''

" If possible, jump to open buffer of a file
let g:fzf_buffers_jump = 1

" This function prevents opening of any buffer/file
" in the NERDTree buffer via FZF
function! FZFOpen(command_str)
    if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
        exe "normal! \<c-w>\<c-w>"
    endif
    exe 'normal! ' . a:command_str . "\<cr>"
endfunction

" Enabling Ctrl+p for fuzzy finding like vscode
nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>
" . = location of current file
nnoremap '.  :call FZFOpen(":FZF " . expand("%:h"))<CR>
" z = FZF
nnoremap 'z  :call FZFOpen(':FZF')<cr>
" b = buffers
nnoremap 'b  :call FZFOpen(':Buffer')<cr>
" t = tags
nnoremap 't  :call FZFOpen(':Tags')<cr>
" h = home
nnoremap 'h  :call FZFOpen(':FZF ~/')<cr>
" r = bashrc
nnoremap 'r  :e ~/.zshrc<cr>
" v = vimrc
nnoremap 'v  :e $MYVIMRC<cr>
" toggle last buffer
nnoremap ''  :b#<cr>
