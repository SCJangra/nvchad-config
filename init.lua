local opt, g = vim.opt, vim.g

-- Mapleader MUST be set before loading mappings
g.mapleader = ','
require 'custom.mappings'

opt.guifont = 'IosevkaSCJ Nerd Font:h14'
opt.whichwrap = '<,>,[,],b,s'
opt.scrolloff = 10
opt.conceallevel = 2
opt.clipboard = '' -- Reemove clipboard options

-- Folding
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
