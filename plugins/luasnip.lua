if vim.g.started_by_firenvim then
  local luasnip = require 'luasnip'

  luasnip.filetype_extend('text', { 'plaintex', 'html' })

  require('luasnip/loaders/from_vscode').lazy_load()
end
