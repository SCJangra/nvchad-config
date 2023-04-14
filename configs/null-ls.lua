local present, null_ls = pcall(require, 'null-ls')
local utils = require 'custom.utils'

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.stylua,
  b.formatting.prettierd,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = utils.setup_auto_format,
}
