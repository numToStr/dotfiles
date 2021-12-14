require('nvim-autopairs').setup()

-- Integration w/ nvim-cmp
require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
