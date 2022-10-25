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
  ['folke/neodev.nvim'] = {},
  ['jose-elias-alvarez/null-ls.nvim'] = {
    after = 'nvim-lspconfig',
    config = function()
      require 'custom.plugins.null-ls'
    end,
  },
  ['anuvyklack/pretty-fold.nvim'] = {
    config = function()
      require('pretty-fold').setup {
        fill_char = ' ',
        process_comment_signs = false,
      }
    end,
  },
  ['nvim-neorg/neorg'] = {
    -- run = ':Neorg sync-parsers', -- This is the important bit!
    config = function()
      require 'custom.plugins.neorg'
    end,
    requires = 'nvim-lua/plenary.nvim',
  },
  ['booperlv/nvim-gomove'] = {
    config = function()
      require 'custom.plugins.nvim-gomove'
    end,
  },
  ['neovim/nvim-lspconfig'] = {
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.plugins.lspconfig'
    end,
  },
  ['iamcco/markdown-preview.nvim'] = {
    run = 'cd app && npm install',
    ft = 'markdown',
  },
  ['folke/which-key.nvim'] = {
    disable = false,
  },
  ['glacambre/firenvim'] = {
    run = function()
      vim.fn['firenvim#install'](0)
    end,
  },
  ['kylechui/nvim-surround'] = {
    config = function()
      require 'custom.plugins.nvim-surround'
    end,
  },
  ['nvim-treesitter/playground'] = {
    after = 'nvim-treesitter',
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
}
