local Rule = require 'nvim-autopairs.rule'
local np = require 'nvim-autopairs'

np.add_rules {
  Rule('$', '$', 'markdown'),
  Rule('$', '$', 'text'),
}
