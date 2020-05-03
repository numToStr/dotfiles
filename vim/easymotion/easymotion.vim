let s:EasyMotion_is_active = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" Press Space to invoke easymotion in up and down direction
" map <Space> <Plug>(easymotion-bd-w)

" Line highlighting
nmap - <Plug>(easymotion-bd-wl)

" EasyMotion can be configured to avoid repetitive use of the h j k and l keys.
" map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-w)
map <Leader>k <Plug>(easymotion-b)
" map <Leader>l <Plug>(easymotion-lineforward)

" Color Reference: https://jonasjacek.github.io/colors/
" Bg: White 15 #ffffff
" Fg: Grey35 240 #585858

" hi link EasyMotionTarget ErrorMsg
hi EasyMotionTarget ctermbg=15 ctermfg=240 guibg=#ffffff guifg=#585858
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget
" hi link EasyMotionTarget2Second EasyMotionShade
"
" hi link EasyMotionMoveHL Search
" hi link EasyMotionIncSearch Search


