local g = vim.g
local U = require 'utils'

g.git_messenger_no_default_mappings = true

U.map("n", "gm", ":GitMessenger<CR>")
