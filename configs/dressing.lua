local options = {}

options.select = {
  backend = { 'builtin' },
  builtin = {
    win_options = {
      winblend = 0,
    },
  },
  get_config = function(opts)
    if opts.kind == 'codeaction' then return {
      builtin = {
        relative = 'cursor',
      },
    } end
  end,
}

options.input = {
  prefer_width = 50,
  insert_only = false,
  win_options = {
    winblend = 0,
  },
  get_config = function(opts)
    if opts.center then return { relative = 'win' } end
  end,
}

return {
  'stevearc/dressing.nvim',
  -- TODO: Lazy load this
  lazy = false,
  opts = options,
}
