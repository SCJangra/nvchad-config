local ui = vim.ui
local tbl_keys = vim.tbl_keys

local run = {
  debug = 'Run debug',
  release = 'Run release',
  tests = 'Run tests',
  check = 'Check',
}

local rust = {
  ['Run debug'] = {
    normal = 'cargo run',
    vtb = {
      ['Dev'] = 'cargo run -- --dev',
      ['Dev devl'] = 'cargo run --features development -- --dev',
      ['Multi node'] = 'cargo build && ./scripts/start_multi_node.sh',
      ['Multi node devl'] = 'cargo build --features development && ./scripts/start_multi_node.sh',
    },
  },
  ['Run release'] = {
    normal = 'cargo run --release',
    vtb = {
      ['Dev'] = 'cargo run --release -- --dev',
      ['Dev devl'] = 'cargo run --release --features development -- --dev',
      ['Multi node'] = 'cargo build --release && ./scripts/start_multi_node.sh',
      ['Multi node devl'] = 'cargo build --release --features development && ./scripts/start_multi_node.sh',
    },
  },
  ['Check'] = {
    normal = 'cargo check',
    vtb = {
      ['All'] = 'cargo check',
      ['Package'] = 'cargo check -p ',
    },
  },
}

local run_vtb_node = function(arg)
  local keys = tbl_keys(rust[arg].vtb)
  local commands = require 'code_runner.commands'

  ui.select(keys, { prompt = 'Select option' }, function(choice)
    if not choice or choice == '' then
      return
    end

    if arg ~= run.check then
      commands.modes.tab(rust[arg].vtb[choice], arg .. ' ' .. choice)
      return
    end
  end)
end

return {
  'CRAG666/code_runner.nvim',
  opts = {
    mode = 'tab',
    focus = true,
    startinsert = false,
    filetype = {
      rust = function(arg)
        local commands = require 'code_runner.commands'

        local project = commands.get_project_command()

        if not project then
          commands.modes.tab(rust[arg].normal, arg)
          return
        end

        if project.name == 'VTB' then
          run_vtb_node(arg)
        end
      end,
    },
    project = {
      ['/run/media/scj/Storage/devl/vtb_substrate/vtb-node'] = {
        name = 'VTB',
        description = 'VTB substrate node',
        command = "echo 'This project cannot be run using the run_project function'",
      },
    },
  },

  keys = {
    {
      '<leader>xr',
      function()
        require('code_runner.commands').run_code(vim.o.filetype, run.release)
      end,
      desc = run.release,
    },
    {
      '<leader>xd',
      function()
        require('code_runner.commands').run_code(vim.o.filetype, run.debug)
      end,
      desc = run.debug,
    },
    {
      '<leader>xt',
      function()
        require('code_runner.commands').run_code(vim.o.filetype, run.tests)
      end,
      desc = run.tests,
    },
    {
      '<leader>xc',
      function()
        require('code_runner.commands').run_code(vim.o.filetype, run.check)
      end,
      desc = run.check,
    },
  },
}
