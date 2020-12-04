local g = vim.g

g.airline_theme = "gruvbox_material"
g.airline_powerline_fonts = 1
g.airline_highlighting_cache = 1
g["airline#extensions#tabline#enabled"] = 1
g["airline#extensions#tabline#formatter"] = "unique_tail"
g["airline#extensions#tmuxline#enabled"] = 0
