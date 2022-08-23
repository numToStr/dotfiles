-- local U = require('Comment.utils')
-- local ctx_comment = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
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
--         return ctx_comment(ctx)
--     end,
-- })

require('Comment').setup(--[[ {
    pre_hook = require('Comment.jsx').calculate,
    -- pre_hook = ctx_comment,
} ]])
