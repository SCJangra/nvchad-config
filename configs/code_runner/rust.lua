local vtb_check_default = nil
local vtb_test_default = nil
local vtb_build_default = nil

local commands = {
  generic = {
    { 'Check', function(runner) runner 'cargo check' end },
    { 'Run debug', function(runner) runner 'cargo run' end },
    { 'Run release', function(runner) runner 'cargo run --release' end },
  },
  VTB = {
    {
      'Check',
      function(runner)
        vim.ui.input({ prompt = 'Package name', default = vtb_check_default, center = true }, function(input)
          if not input then return end

          vtb_check_default = input
          if input == '' then
            runner 'cargo check'
          else
            runner('cargo check -p ' .. input)
          end
        end)
      end,
    },
    {
      'Test',
      function(runner)
        vim.ui.input({ prompt = 'Package name', default = vtb_test_default, center = true }, function(input)
          if not input then return end

          vtb_test_default = input
          if input == '' then
            runner 'cargo test --release'
          else
            runner('cargo test --release -p ' .. input)
          end
        end)
      end,
    },
    { 'Run dev mode', function(runner) runner 'cargo run --release --features dev -- --dev' end },
    {
      'Run multi node',
      function(runner) runner 'cargo build --release --features dev && ./scripts/start_multi_node.sh' end,
    },
  },
}

return function()
  local code_runner = require 'code_runner.commands'
  local project = code_runner.get_project_command()
  -- stylua: ignore
  local names = project
    and vim.tbl_map(function(cmd) return cmd[1] end, commands[project.name])
    or  vim.tbl_map(function(cmd) return cmd[1] end, commands.generic)

  vim.ui.select(names, { prompt = ' Select option ' }, function(choice, index)
    if not choice or choice == '' then return end

    if project then
      local runner = function(cmd) code_runner.modes.tab(cmd, commands[project.name][index][1]) end
      commands[project.name][index][2](runner)
    else
      local runner = function(cmd) code_runner.modes.tab(cmd, commands.generic[index][1]) end
      commands.generic[index][2](runner)
    end
  end)
end
