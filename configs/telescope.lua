local opts = {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case". The default case_mode is "smart_case"
    },
  },
  extensions_list = (function()
    local default = require('plugins.configs.telescope').extensions_list
    local list = { 'fzf' }

    for _, e in ipairs(default) do
      table.insert(list, e)
    end

    return list
  end)(),
}

local keys = {
  { '<leader>f', '<CMD>Telescope find_files<CR>', desc = 'Find files' },
  { '<leader>st', '<CMD>Telescope live_grep<CR>', desc = 'Text' },
  { '<leader>sh', '<CMD>Telescope highlights<CR>', desc = 'Highlights' },
  { '<leader>sc', '<CMD>Telescope themes<CR>', desc = 'Colorschemes' },
  { '<leader>sp', '<CMD>Telescope resume<CR>', desc = 'Resume previous search' },
  {
    '<leader>sg',
    function()
      vim.ui.input({ prompt = 'Enter grep text', center = true }, function(input)
        if not input then return end
        require('telescope.builtin').grep_string { search = input }
      end)
    end,
    desc = 'Grep string',
  },
}

return {
  'nvim-telescope/telescope.nvim',
  opts = opts,
  keys = keys,
  dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
