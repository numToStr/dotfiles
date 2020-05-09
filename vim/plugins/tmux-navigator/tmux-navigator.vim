" Remapping all key binding with Alt key, which will also work with tmux w/ tmux-tilish
let g:tmux_navigator_no_mappings = 1

noremap <silent> <M-h> :TmuxNavigateLeft<CR>
noremap <silent> <M-j> :TmuxNavigateDown<CR>
noremap <silent> <M-k> :TmuxNavigateUp<CR>
noremap <silent> <M-l> :TmuxNavigateRight<CR>
