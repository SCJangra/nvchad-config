local opts = {
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
}

return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  ft = 'norg',
  opts = opts,
  dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
}
