local overrides = require 'custom.configs.overrides'

---@type NvPluginSpec[]
local plugins = {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- format & linting
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require 'custom.configs.null-ls' end,
      },
    },
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end, -- Override to setup mason-lspconfig
  },

  require 'custom.configs.telescope',
  require 'custom.configs.mason',

  { 'nvim-treesitter/nvim-treesitter', opts = overrides.treesitter },
  { 'nvim-tree/nvim-tree.lua', opts = overrides.nvimtree },
  { 'lewis6991/gitsigns.nvim', opts = overrides.gitsigns },

  -- External plugins
  require 'custom.configs.code_runner',
  require 'custom.configs.dressing',
  { 'lvimuser/lsp-inlayhints.nvim', config = true },
  {
    'SmiteshP/nvim-navic',
    dependencies = 'neovim/nvim-lspconfig',
    opts = {
      separator = '  ',
      highlight = true,
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
      },
    },
  },
  require 'custom.configs.neogit',
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    lazy = false,
    opts = {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {
          config = {
            icons = {
              code_block = {
                conceal = true,
              },
            },
          },
        }, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '/run/media/scj/Storage/docs/neorg',
            },
          },
        },
      },
    },
    dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
  },
}

return plugins
