local U = require "utils"
local g = vim.g
local cmd = vim.cmd
local exec = vim.api.nvim_exec

g.DevIconsEnableFoldersOpenClose = 1

g.NERDTreeMinimalMenu = 1
g.NERDTreeMinimalUI = 1
g.NERDTreeShowHidden = 1
g.NERDTreeWinSize = 35

-- These are spaces bcz the NERDTree is too close to side panel
g.NERDTreeDirArrowExpandable = " "
g.NERDTreeDirArrowCollapsible = " "

g.NERDTreeIgnore = { ".git$", ".idea$", "node_modules" }
g.NERDTreeAutoDeleteBuffer = 1

-- Indicate every single untracked file under an untracked dir
g.NERDTreeGitStatusUntrackedFilesMode = 'all'
-- To hide the boring brackets ([ ])
g.NERDTreeGitStatusConcealBrackets = 0

g.NERDTreeGitStatusIndicatorMapCustom = {
    Modified  = 'M',
    Staged    = 'A',
    Untracked = 'U',
    Renamed   = 'R',
    Unmerged  = '═',
    Deleted   = 'D',
    Dirty     = '!',
    Ignored   = 'I',
    Clean     = 'C',
    Unknown   = '?',
}

function OpenNERDTree()
    cmd("NERDTreeToggle")
    U.move_cursor_from_tree()
end

U.map("n", "<C-N>", "<CMD>lua OpenNERDTree()<CR>")

exec([[
    " To hide signcolumn in NERDTree
    autocmd FileType nerdtree call TreeSetting()

    function! TreeSetting()
        " To remove signcolumn
        setlocal signcolumn=no
        " To remove forward slash after directory
        setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
    endfunction


    " For starting NERDTree when vim is opened on a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

    " For closing vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


    function! NERDTreeIsOpen()
      return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1) && g:NERDTree.IsOpen()
    endfunction

    function! NERDTreeSync()
      if &modifiable && !&diff && NERDTreeIsOpen() && strlen(expand('%')) > 0 && bufname('%') !~# "^NERD_tree_"
        NERDTreeFind
        setlocal cursorline
        wincmd p
      endif
    endfunction

    " Auto sync
    autocmd bufenter * call NERDTreeSync()
]], "")
