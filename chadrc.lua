-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "onedark",
  hl_add = {
    Folded = { fg = '#abb2bf', bg = '#252931' },
  },
  hl_override = {
    Function = { bold = true, italic = true },
    TSFunction = { bold = true, italic = true },
    Comment = { italic = true },
  },
  transparency = false,
}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = 'custom.plugins.lspconfig',
    },
    statusline = {
      -- separator_style = 'round',
    },
  },
  override = {
    ['nvim-treesitter/nvim-treesitter'] = {
      ensure_installed = 'all',
      playground = {
        enable = true,
      },
    },
    ['lewis6991/gitsigns.nvim'] = {
      signs = {
        add = { text = '▌' },
        change = { text = '▌' },
      },
    },
    ['hrsh7th/nvim-cmp'] = {
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'neorg' },
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
    },
    ['williamboman/mason.nvim'] = {
      ensure_installed = {
        -- Lua
        'stylua',
        'lua-language-server',

        -- Web
        'css-lsp',
        'html-lsp',
        'json-lsp',
        'typescript-language-server',
        'emmet-ls',

        -- Rust
        'rust-analyzer',

        -- Ethereum
        'solidity',

        -- C, C++
        'clangd',
        'clang-format',
        'cmake-language-server',
        'cmakelang',

        -- Toml
        'taplo',
      },
    },
  },
  user = require 'custom.plugins',
}

M.mappings = require 'custom/disabled_mappings'

return M
