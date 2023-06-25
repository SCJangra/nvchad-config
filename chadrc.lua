---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require 'custom.highlights'

M.ui = {
  theme = 'everblush',
  transparency = false,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  hl_override = highlights.override,
  hl_add = highlights.add,
  cmp = {
    icons = true,
    lspkind_text = true,
    style = 'atom', -- default/flat_light/flat_dark/atom/atom_colored
    border_color = 'grey_fg', -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = 'colored', -- colored / simple
  },
}

M.plugins = 'custom.plugins'

-- check core.mappings for table structure
M.mappings = require 'custom.disabled_mappings'

return M
