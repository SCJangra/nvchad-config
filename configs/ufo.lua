local g = vim.g

local utils = require 'custom.utils'

local on_fallback_exception = function(bufnr, err, fallback)
  if type(err) == 'string' and err:match 'UfoFallbackException' then
    return require('ufo').getFolds(bufnr, fallback)
  else
    return require('promise').reject(err)
  end
end

local provider_selector = function(bufnr, filetype)
  if utils.tbl_contains_match(g.fold_ignore_ft, filetype) then return '' end

  require('ufo')
    .getFolds(bufnr, 'lsp')
    :catch(function(err) on_fallback_exception(bufnr, err, 'treesitter') end)
    :catch(function(err) on_fallback_exception(bufnr, err, 'indent') end)
end

local opts = {
  provider_selector = provider_selector,
}

local keys = {
  { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
  { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Open all folds' },
}

return {
  'kevinhwang91/nvim-ufo',
  opts = opts,
  keys = keys,
  main = 'ufo',
  event = { 'LspAttach', 'BufReadPost' },
  dependencies = { 'kevinhwang91/promise-async' },
}
