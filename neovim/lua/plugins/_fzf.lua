local U = require 'utils'
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd

fn.setenv("FZF_DEFAULT_OPTS", "--color=dark --reverse --keep-right --marker=+ --padding=1,1")
fn.setenv("FZF_DEFAULT_COMMAND", "fd --type f --type l --hidden --follow || git ls-files --cached --others --exclude-standard")

-- Customize fzf colors to match your color scheme
-- fzf#wrap translates this to a set of `--color` options
g.fzf_colors = {
    fg = { "fg", "Normal" },
    bg = { "bg", "Normal" },
    hl = { "fg", "Red" },
    ["fg+"] = { "fg", "MyWhite" },
    ["bg+"] = { "bg", "Normal" },
    ["hl+"] = { "fg", "Red" },
    info = { "bg", "Normal" },
    prompt = { "fg", "MyWhite" },
    pointer = { "fg", "MyWhite" },
    marker = { "fg", "Yellow" },
    spinner = { "fg", "MyWhite" },
    header = { "bg", "Normal" }
}

-- Enable per-command history
-- - History files will be stored in the specified directory
-- - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
--   'previous-history' instead of 'down' and 'up'.
g.fzf_history_dir = "~/.local/share/fzf-history"

g.fzf_layout = {
    window = {
        width = 0.5,
        height = 0.3,
        yoffset = 0,
    },
}

cmd [[ command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { "options": "--prompt '⯈ '"}, <bang>0) ]]

g.fzf_preview_window = ""
g.fzf_buffers_jump = 1

function FZFOpen(cmd_str)
    U.move_cursor_from_tree()
    cmd(cmd_str)
end

-- Ctrl-p = fuzzy finder
U.map("n", "<C-P>", "<CMD>lua FZFOpen(':Files')<CR>")

-- . = location of current file
U.map("n", "'.", "<CMD>lua FZFOpen(':FZF "..vim.fn.expand("%:h").."')<CR>")

-- z = FZF
U.map("n", "'z", "<CMD>lua FZFOpen(':FZF')<CR>")

-- b = buffers
U.map("n", "'b", "<CMD>lua FZFOpen(':Buffers')<CR>")

-- t = tags
U.map("n", "'t", "<CMD>lua FZFOpen(':Tags')<CR>")

-- i = history
U.map("n", "'i", "<CMD>lua FZFOpen(':History')<CR>")

-- h = home
U.map("n", "'h", "<CMD>lua FZFOpen(':FZF ~/')<CR>")
