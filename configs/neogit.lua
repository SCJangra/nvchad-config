local opts = {
  status = {
    recent_commit_count = 20,
  },
  integrations = {
    diffview = true,
  },
}

local keys = {
  { '<leader>g', '<CMD>lua require("neogit").open()<CR>', desc = 'Neogit' },
}

return {
  'NeogitOrg/neogit',
  opts = opts,
  keys = keys,
}
