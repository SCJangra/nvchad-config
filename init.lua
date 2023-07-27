require 'custom.autocommands'
require 'custom.statuscolumn'

local o, g = vim.o, vim.g

-- Mapleader MUST be set before loading mappings
g.mapleader = ','
require 'custom.mappings'

o.guifont = 'IosevkaSCJ Nerd Font:h14'
o.whichwrap = '<,>,[,],b,s'
o.scrolloff = 10
o.conceallevel = 2
o.clipboard = '' -- Reemove clipboard options

-- Folding
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
