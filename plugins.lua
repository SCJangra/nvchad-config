local overrides = require 'custom.configs.overrides'

---@type NvPluginSpec[]
local plugins = {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- format & linting
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require 'custom.configs.null-ls'
        end,
      },
    },
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end, -- Override to setup mason-lspconfig
  },
  {
    'nvim-telescope/telescope.nvim',
    opts = overrides.telescope,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },

  -- override plugin configs
  { 'williamboman/mason.nvim', opts = overrides.mason },
  { 'nvim-treesitter/nvim-treesitter', opts = overrides.treesitter },
  { 'nvim-tree/nvim-tree.lua', opts = overrides.nvimtree },
  { 'lewis6991/gitsigns.nvim', opts = overrides.gitsigns },

  -- External plugins
  {
    'TimUntersberger/neogit',
    config = function()
      require 'custom.configs.neogit'
    end,
  },
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    lazy = false,
    opts = {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.norg.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '/run/media/scj/Storage/docs/neorg',
            },
          },
        },
      },
    },
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },
}

return plugins
