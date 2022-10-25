local null_ls = require 'null-ls'
local b = null_ls.builtins
local set_format_on_save = require('custom.utils').set_format_on_save

local sources = {
  b.formatting.clang_format,
  b.formatting.prettierd,
  b.formatting.stylua,
  b.formatting.rustfmt.with {
    extra_args = { '--edition=2021' },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,

  on_attach = set_format_on_save,
}
