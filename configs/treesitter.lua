local opts = {
  ensure_installed = 'all',
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

return {
  'nvim-treesitter/nvim-treesitter',
  opts = opts,
}
