local rust = require 'custom.configs.code_runner.rust'

return {
  'CRAG666/code_runner.nvim',
  opts = {
    mode = 'tab',
    focus = true,
    startinsert = false,
    filetype = {
      rust = rust,
    },
    project = {
      ['/media/sachin/Storage/devl/vtb_substrate/vtb-node'] = {
        name = 'VTB',
        description = 'VTB substrate node',
        command = "echo 'This project cannot be run using the run_project function'",
      },
    },
  },

  keys = {
    {
      '<leader>x',
      function() require('code_runner.commands').run_code(vim.o.filetype) end,
      desc = 'Tasks',
    },
  },
}
