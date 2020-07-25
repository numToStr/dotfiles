" Enabling Ctrl+p for fuzzy finding like vscode
nnoremap <silent> <C-p> :Files<CR>
" . = location of current file
nnoremap '.  :exe ":FZF " . expand("%:h")<CR>
" z = FZF
nnoremap 'z  :FZF<cr>
" b = buffers
nnoremap 'b  :Buffers<cr>
" f = fzf
nnoremap 'f  :Files<cr>
" t = tags
nnoremap 't  :Tags<cr>
" h = home
nnoremap 'h  :FZF ~/<cr>
" r = bashrc
nnoremap 'r  :e ~/.zshrc<cr>
" v = vimrc
nnoremap 'v  :e $MYVIMRC<cr>
" toggle last buffer
nnoremap ''  :b#<cr>

" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse --margin=1,1 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1"

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
