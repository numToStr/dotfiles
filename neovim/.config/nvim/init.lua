-- Vanilla Config
require('numToStr.settings')
require('numToStr.autocmd')
require('numToStr.plugins')
require('numToStr.keybinds')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end
