require("gitsigns").setup(
    {
        signs = {
            add = {hl = "GitGutterAdd", text = "+"},
            change = {hl = "GitGutterChange", text = "~"},
            delete = {hl = "GitGutterDelete"},
            topdelete = {hl = "GitGutterDelete"},
            changedelete = {hl = "GitGutterChange", text = "="}
        }
    }
)
