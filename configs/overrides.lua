local M = {}

M.gitsigns = {
  signs = {
    add = { text = '▌' },
    change = { text = '▌' },
  },
}

M.treesitter = {
  ensure_installed = 'all',
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    'lua-language-server',
    'stylua',
    'rust-analyzer',
    'typescript-language-server',
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
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

return M
