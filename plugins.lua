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
  require 'custom.configs.treesitter',
  require 'custom.configs.nvimtree',
  require 'custom.configs.gitsigns',

  -- External plugins
  require 'custom.configs.code_runner',
  require 'custom.configs.dressing',
  require 'custom.configs.inlayhints',
  require 'custom.configs.navic',
  require 'custom.configs.neogit',
  require 'custom.configs.neorg',
  require 'custom.configs.neotree',
}

return plugins
