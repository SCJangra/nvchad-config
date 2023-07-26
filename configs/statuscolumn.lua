local config = function()
  local builtin = require 'statuscol.builtin'
  local statuscol = require 'statuscol'

  statuscol.setup {
    segments = {
      { text = { '%s' }, click = 'v:lua.ScSa' },
      { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
      { text = { builtin.foldfunc, '  ' }, click = 'v:lua.ScFa' },
    },
    ft_ignore = { 'neo-tree' },
  }
end

return {
  'luukvbaal/statuscol.nvim',
  config = config,
}
