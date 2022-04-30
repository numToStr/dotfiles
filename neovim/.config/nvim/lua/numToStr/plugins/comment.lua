-- local U = require('Comment.utils')
-- local tsu = require('ts_context_commentstring.utils')
-- local tsi = require('ts_context_commentstring.internal')
--
-- local function calculate(ctx)
--     local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'
--
--     local location = ctx.ctype == U.ctype.block and tsu.get_cursor_location()
--         or (ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V) and tsu.get_visual_start_location()
--
--     return tsi.calculate_commentstring({
--         key = type,
--         location = location,
--     })
-- end
--
-- require('Comment').setup({
--     pre_hook = function(ctx)
--         for _ = 1, 100000, 1 do
--             local function hello() end
--             hello()
--         end
--
--         local start = os.clock()
--         for _ = 1, 1000, 1 do
--             require('Comment.ft').calculate(ctx)
--         end
--         print('this:', os.clock() - start)
--
--         local start2 = os.clock()
--         for _ = 1, 1000, 1 do
--             calculate(ctx)
--         end
--         print('that:', os.clock() - start2)
--
--         -- return require('Comment.jsx').calculate(ctx)
--         return calculate(ctx)
--     end,
-- })

require('Comment').setup({
    pre_hook = function(ctx)
        return require('Comment.jsx').calculate(ctx)
    end,
})
