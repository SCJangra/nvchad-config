local api = vim.api
local opt = vim.opt

api.nvim_create_augroup('nvim_ghost_user_autocommands', { clear = true })
api.nvim_create_autocmd({ 'User' }, {
  group = 'nvim_ghost_user_autocommands',
  pattern = 'localhost:3000',
  callback = function()
    opt.filetype = 'markdown'
  end,
})
