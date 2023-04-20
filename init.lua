local opt, g = vim.opt, vim.g

-- Mapleader MUST be set before loading mappings
g.mapleader = ','
require 'custom.mappings'

opt.guifont = 'IosevkaSCJ Nerd Font:h14'
opt.whichwrap = '<,>,[,],b,s'
opt.scrolloff = 10
opt.conceallevel = 2
opt.clipboard = '' -- Reemove clipboard options

-- opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- opt.foldlevelstart = 99
-- opt.foldenable = true
-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- opt.foldcolumn = '1' -- '0' is not bad

-- opt.statuscolumn = '%s%l %C '

-- Folding
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
