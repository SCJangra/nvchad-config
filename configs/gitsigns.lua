local opts = {
  signs = {
    add = { text = '▌' },
    change = { text = '▌' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '🮌' },
  },
}

return {
  'lewis6991/gitsigns.nvim',
  opts = opts,
}
