local U = require 'utils'
local g = vim.g
local cmd = vim.cmd

-- Disable default mappings
g.EasyMotion_do_mapping = 0
-- keep cursor column when JK motion
g.EasyMotion_startofline = 0
-- EasyMotion work similarly to Vim's smartcase
g.EasyMotion_smartcase = 1

-- map <Space> <Plug>(easymotion-bd-w)
-- nmap - <Plug>(easymotion-bd-wl)
-- " hjkl motions: Line motions
-- " map <Leader>h <Plug>(easymotion-linebackward)
-- " map <Leader>j <Plug>(easymotion-w)
-- " map <Leader>k <Plug>(easymotion-b)
-- " map <Leader>l <Plug>(easymotion-lineforward)

U.map("n", "<S-K>", "<Nop>")
U.map("n", "<S-j>", "<Nop>")

-- I don't know how to map <Plug> commands in lua
U.map('n', '<S-J>', '<Plug>(easymotion-w)', { noremap = false })
U.map('n', '<S-K>', '<Plug>(easymotion-b)', { noremap = false })

-- Color Reference: https://jonasjacek.github.io/colors/
-- Bg: White 15 #ffffff
-- Fg: Grey11 234 #1c1c1c

U.highlight("EasyMotionTarget", { bg = "#ffffff", fg = "#1c1c1c" })

U.hiLinks({
    EasyMotionShade = "Comment",
    EasyMotionTarget2First = "EasyMotionTarget",
    EasyMotionTarget2Second = "EasyMotionTarget",
})

-- cmd("hi EasyMotionTarget ctermbg=15 ctermfg=234 guibg=#ffffff guifg=#1c1c1c")
-- cmd("hi link EasyMotionShade Comment")
-- cmd("hi link EasyMotionTarget2First EasyMotionTarget")
-- cmd("hi link EasyMotionTarget2Second EasyMotionTarget")
