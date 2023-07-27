local o, g = vim.o, vim.g
local utils = require 'custom.utils'

o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:󰧗,foldsep: ,foldclose:󰧛]]
o.foldcolumn = '0' -- '0' is not bad
o.statuscolumn = '%!v:lua.get_status_col()'

g.fold_ignore_ft = { 'neo-tree', 'Neogit', 'help' }

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
