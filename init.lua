require 'custom.autocommands'

local opt, g = vim.opt, vim.g
local utils = require 'custom.utils'

-- Mapleader MUST be set before loading mappings
g.mapleader = ','
require 'custom.mappings'

opt.guifont = 'IosevkaSCJ Nerd Font:h14'
opt.whichwrap = '<,>,[,],b,s'
opt.scrolloff = 10
opt.conceallevel = 2
opt.clipboard = '' -- Reemove clipboard options

opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.fillchars = [[eob: ,fold: ,foldopen:󰧗,foldsep: ,foldclose:󰧛]]
opt.foldcolumn = '0' -- '0' is not bad
opt.statuscolumn = '%!v:lua.get_status_col()'

local get_fold = function(lnum)
  local fcs = vim.opt.fillchars:get()

  if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return ' ' end
  return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
end

_G.get_status_col = function()
  local fold

  if utils.tbl_contains_match(vim.g.fold_ignore_ft, vim.o.filetype) then
    fold = ''
  else
    fold = ' ' .. get_fold(vim.v.lnum) .. ' '
  end

  return '%s%=%l' .. fold
end

vim.g.fold_ignore_ft = { 'neo-tree', 'Neogit', 'help' }

-- Folding
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
