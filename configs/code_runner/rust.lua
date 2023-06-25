local vtb_check_default = nil
local vtb_build_default = nil

local commands = {
  {
    name = 'Check',
    run = function(runner) runner 'cargo check' end,
    VTB = function(runner)
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
    name = 'Run release',
    run = function(runner) runner 'cargo check' end,
    VTB = function(runner)
      vim.ui.input({ prompt = 'Features', default = vtb_build_default, center = true }, function(input)
        if not input then return end

        vtb_build_default = input
        if input == '' then
          runner 'cargo build --release && ./scripts/start_multi_node.sh'
        else
          runner(
            table.concat { 'cargo build --release --features ', '"', input, '"', ' && ./scripts/start_multi_node.sh' }
          )
        end
      end)
    end,
  },
}

return function()
  local names = vim.tbl_map(function(cmd) return cmd.name end, commands)

  vim.ui.select(names, { prompt = 'Select option' }, function(choice, index)
    if not choice or choice == '' then return end

    local code_runner = require 'code_runner.commands'
    local project = code_runner.get_project_command()
    local runner = function(cmd) code_runner.modes.tab(cmd, commands[index].name) end

    if project then
      commands[index][project.name](runner)
    else
      commands[index].run(runner)
    end
  end)
end
