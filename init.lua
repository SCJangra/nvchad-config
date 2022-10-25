-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.

require 'custom.autocmds'
require 'custom.digraphs'
local g, opt = vim.g, vim.opt

g.mapleader = ','
require 'custom.mappings'

opt.guifont = 'IosevkaSCJ Nerd Font:h16'
opt.whichwrap = '<,>,[,],b,s'
opt.scrolloff = 10
opt.conceallevel = 2
-- opt.timeoutlen = 100

-- Fold
-- vim.cmd [[ set fillchars=fold:\ ]]
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldminlines = 1
-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- opt.foldcolumn = '1'

if vim.g.started_by_firenvim then
  -- opt.number = false
  opt.signcolumn = 'no'
end
