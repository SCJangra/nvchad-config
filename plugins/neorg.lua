require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
      },
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          notes = '/run/media/scj/Storage/Documents/Notes/neorg',
        },
      },
    },
    ['core.norg.manoeuvre'] = {},
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.norg.concealer'] = {},
    -- ['core.gtd.base'] = {},
    -- ['core.integrations.telescope'] = {},
  },
}
