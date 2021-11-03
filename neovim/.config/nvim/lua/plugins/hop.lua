local U = require('utils')

require('hop').setup()

U.map('n', '<S-j>', '<CMD>HopWordAC<CR>')
U.map('n', '<S-k>', '<CMD>HopWordBC<CR>')
