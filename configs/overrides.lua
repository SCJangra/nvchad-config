local M = {}

M.gitsigns = {
  signs = {
    add = { text = '▌' },
    change = { text = '▌' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '🮌' },
  },
}

-- git support in nvimtree
M.nvimtree = {
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

return M
