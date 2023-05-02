vim.loader.enable()
if vim.g.vscode ~= nil then
    return require('numToStr.vscode')
end
require('numToStr.settings')
require('numToStr.autocmd')
require('numToStr.plugins')
require('numToStr.keybinds')
