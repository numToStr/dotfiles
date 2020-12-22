local U = require "utils"
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local api = vim.api

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
    local last_pos = api.nvim_get_current_win()
    cmd("NERDTreeToggle")
    api.nvim_set_current_win(last_pos)
end

U.map("n", "<C-N>", "<CMD>lua OpenNERDTree()<CR>")

function TreeSetting()
    -- To hide signcolumn in NERDTree
    vim.wo.signcolumn = 'no'
    -- To remove forward slash after directory
    vim.wo.conceallevel = 3
    -- FIXME: I don't know how to write this in lua
    cmd('syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained')
end

U.define_autocmd({
    event = 'FileType',
    pattern = 'nerdtree',
    command = 'lua TreeSetting()'
})

-- For starting NERDTree when vim is opened on a directory
U.define_autocmd({
    event = 'StdinReadPre',
    command = 'let s:std_in = 1'
})

U.define_autocmd({
    event = 'VimEnter',
    command = 'if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe "NERDTree" argv()[0] | wincmd p | ene | exe "cd ".argv()[0] | endif'
})

-- For closing vim if the only window left open is a NERDTree
U.define_autocmd({
    event = 'BufEnter',
    command = 'if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'
})

api.nvim_exec([[
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
