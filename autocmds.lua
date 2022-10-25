local api = vim.api

api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank {}
  end,
})

if vim.g.started_by_firenvim then
  api.nvim_create_autocmd('BufEnter', {
    pattern = '127.0.0.1_*.txt',
    command = 'set filetype=markdown',
  })
end

-- local get_node_text = vim.treesitter.query.get_node_text
-- local open_floating_preview = vim.lsp.util.open_floating_preview
-- local get_math_text = function(node)
--   local parent = node:parent()
--
--   while parent do
--     local pt = parent:type()
--
--     print('Type', pt)
--
--     if pt == 'inline_math' then
--       local text = get_node_text(parent, 0)
--       print('Math', text)
--       return text:sub(2, #text - 1)
--     elseif pt == 'ranged_tag' then
--       local text = get_node_text(parent, 0)
--       print('Math', text)
--       return text:sub(6, #text - 6)
--     end
--
--     parent = parent:parent()
--   end
-- end
--
-- api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
--   pattern = '*.norg',
--   callback = function()
--     local ts_utils = require 'nvim-treesitter.ts_utils'
--
--     local node = ts_utils.get_node_at_cursor(0)
--     if not node then
--       return
--     end
--
--     print('Got node', vim.inspect(node))
--
--     local math = get_math_text(node)
--     if not math then
--       return
--     end
--
--     print('Got math', vim.inspect(math))
--
--     math = require('nabla').gen_drawing { math }
--
--     print('Got math drawing', vim.inspect(math))
--
--     if type(math) ~= 'table' then
--       return
--     end
--
--     open_floating_preview(math, 'markdown', {
--       wrap = false,
--       focusable = false,
--       border = 'single',
--     })
--   end,
-- })
