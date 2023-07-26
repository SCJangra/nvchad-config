local opts = {
  git = {
    enable = true,
  },

  view = {
    signcolumn = 'yes',
  },

  renderer = {
    highlight_git = true,
    icons = {
      git_placement = 'signcolumn',
      show = {
        git = true,
      },
    },
  },
}

local keys = {
  { '<leader>e', '<CMD>NvimTreeToggle<CR>', desc = 'Explorer' },
}

return {
  'nvim-tree/nvim-tree.lua',
  opts = opts,
  keys = keys,
  enabled = false,
}
