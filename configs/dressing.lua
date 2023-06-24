return {
  'stevearc/dressing.nvim',
  -- TODO: Lazy load this
  lazy = false,
  opts = {
    select = {
      backend = { 'builtin' },
      get_config = function(opts)
        if opts.kind == 'codeaction' then
          return {
            builtin = {
              relative = 'cursor',
            },
          }
        end
      end,
    },
  },
}