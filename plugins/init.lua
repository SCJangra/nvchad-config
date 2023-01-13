return {
  ['ahmedkhalf/project.nvim'] = {
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension 'projects'
      require 'custom.plugins.project_nvim'
    end,
  },
  ['pianocomposer321/yabs.nvim'] = {
    module = 'yabs',
    config = function()
      require 'custom.plugins.yabs_nvim'
    end,
  },
  ['sindrets/diffview.nvim'] = {
    module = 'diffview',
    cmd = 'DiffviewOpen',
  },
  ['TimUntersberger/neogit'] = {
    module = 'neogit',
    config = function()
      require 'custom.plugins.neogit'
    end,
    requires = {
      'sindrets/diffview.nvim',
    },
  },
  ['Saecki/crates.nvim'] = {
    ft = 'toml',
    config = function()
      require('crates').setup()
    end,
    requires = {
      'nvim-lua/plenary.nvim',
    },
  },
  ['folke/neodev.nvim'] = {
    module = 'neodev',
  },
  ['jose-elias-alvarez/null-ls.nvim'] = {
    after = 'nvim-lspconfig',
    config = function()
      require 'custom.plugins.null-ls'
    end,
  },
  ['anuvyklack/pretty-fold.nvim'] = {
    after = 'nvim-treesitter',
    config = function()
      require('pretty-fold').setup {
        fill_char = ' ',
        process_comment_signs = false,
      }
    end,
  },
  ['iamcco/markdown-preview.nvim'] = {
    run = 'cd app && npm install',
    ft = 'markdown',
  },
  ['nvim-treesitter/playground'] = {
    after = 'nvim-treesitter',
  },
  ['jbyuki/nabla.nvim'] = {
    module = 'nabla',
  },
  ['folke/trouble.nvim'] = {
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'nvim-lspconfig',
    config = function()
      require('trouble').setup {}
    end,
  },
  -- Builtin plugins
  ['neovim/nvim-lspconfig'] = {
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.plugins.lspconfig'
    end,
  },
  ['folke/which-key.nvim'] = {
    disable = false,
  },
  ['windwp/nvim-autopairs'] = {
    config = function()
      require('plugins.configs.others').autopairs()
      require 'custom.plugins.nvim-autopairs'
    end,
  },
  ['L3MON4D3/LuaSnip'] = {
    config = function()
      require 'custom.plugins.luasnip'
      require('plugins.configs.others').luasnip()
    end,
  },
  -- The below plugins are not lazy loaded
  ['booperlv/nvim-gomove'] = {
    config = function()
      require 'custom.plugins.nvim-gomove'
    end,
  },
  ['kylechui/nvim-surround'] = {
    config = function()
      require 'custom.plugins.nvim-surround'
    end,
  },
  ['nvim-neorg/neorg'] = {
    -- ft = 'norg',
    run = ':Neorg sync-parsers',
    config = function()
      require 'custom.plugins.neorg'
    end,
    requires = 'nvim-lua/plenary.nvim',
  },
  ['f-person/git-blame.nvim'] = {},
}
