let s:EasyMotion_is_active = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Press Space to invoke easymotion in up and down direction
map <Space> <Plug>(easymotion-bd-w)

" EasyMotion can be configured to avoid repetitive use of the h j k and l keys.
" Press \ + key
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
