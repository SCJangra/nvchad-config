local api = vim.api
local set = vim.keymap.set

local function termcodes(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

-- Comment
set('n', '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment' })
set('v', '<leader>/', function()
  api.nvim_input '<ESC>'
  vim.schedule(function()
    require('Comment.api').toggle.linewise(vim.fn.visualmode())
  end)
end, { desc = 'Toggle comment' })

-- Window movement
set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

-- Nvim
set('n', '<leader>c', '<CMD>bd<CR>', { desc = 'Close buffer' })
set('n', '<leader>h', '<CMD>noh<CR>', { desc = 'Clear highlight' })
set('n', '<leader>q', '<CMD>q<CR>', { desc = 'Close window' })
set('n', '<leader>w', '<CMD>w<CR>', { desc = 'Save file' })

-- Misc
set('n', '<leader>d', '<CMD>DiffviewOpen<CR>', { desc = 'DiffView' })
set('n', '<leader>e', '<CMD>NvimTreeToggle<CR>', { desc = 'Explorer' })
set('n', '<leader>f', '<CMD>Telescope find_files<CR>', { desc = 'Find files' })
set('n', '<leader>g', '<CMD>lua require("neogit").open()<CR>', { desc = 'Neogit' })
set('n', '<leader>u', '<CMD>NvChadUpdate<CR>', { desc = 'Update NvChad' })
set('t', '<C-x>', termcodes '<C-\\><C-N>', { desc = '   escape terminal mode' })
set('n', '<leader>m', '<CMD>lua require("nabla").popup()<CR>', { desc = 'Math' })

-- LSP
set('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', { desc = 'LSP definition' })
set('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', { desc = 'LSP declaration' })
set('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', { desc = 'LSP implementation' })
set('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', { desc = 'LSP references' })
set('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', { desc = 'LSP hover' })
set('n', '<leader>lr', '<CMD>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename' })
set('n', '<leader>la', '<CMD>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code action' })
set('n', '<leader>ll', '<CMD>lua vim.diagnostic.open_float()<CR>', { desc = 'Show line diagnostic' })
set('n', '<leader>lj', '<CMD>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
set('n', '<leader>lk', '<CMD>lua vim.diagnostic.goto_next()<CR>', { desc = 'Prev diagnostic' })
set('n', '<leader>lR', '<CMD>LspRestart<CR>', { desc = 'Restart' })

-- Execute tasks/builds
set('n', '<leader>xr', '<CMD>lua require("yabs"):run_task("run")<CR>', { desc = 'Run' })
set('n', '<leader>xb', '<CMD>lua require("yabs"):run_task("build")<CR>', { desc = 'Build' })
set('n', '<leader>xt', '<CMD>lua require("yabs"):run_task("test")<CR>', { desc = 'Test' })

-- Packer
set('n', '<leader>ps', '<CMD>PackerSync<CR>', { desc = 'Sync' })
set('n', '<leader>pS', '<CMD>PackerStatus<CR>', { desc = 'Status' })

-- Search
set('n', '<leader>sp', function()
  if package.loaded['telescope'] then
    require('telescope').extensions.projects.projects()
    return
  end

  vim.cmd 'Telescope projects'
  vim.api.nvim_input '<ESC>'

  vim.schedule(function()
    require('telescope').extensions.projects.projects()
  end)
end, { desc = 'Projects' })
set('n', '<leader>st', '<CMD>Telescope live_grep<CR>', { desc = 'Text' })
set('n', '<leader>sh', '<CMD>Telescope highlights<CR>', { desc = 'Highlights' })

-- TBufLine
set('n', 'L', '<CMD>lua require("nvchad_ui.tabufline").tabuflineNext()<CR>', { desc = 'Next buffer' })
set('n', 'H', '<CMD>lua require("nvchad_ui.tabufline").tabuflinePrev()<CR>', { desc = 'Prev buffer' })
set('n', '<C-S-l>', '<CMD>tabnext<CR>', { desc = 'Next Tab' })
set('n', '<C-S-h>', '<CMD>tabprevious<CR>', { desc = 'Prev Tab' })

-- Luasnip
set('i', '<C-l>', '<CMD>lua require("luasnip").jump(1)<CR>', { desc = 'Luasnip jump next' })
set('i', '<C-h>', '<CMD>lua require("luasnip").jump(-1)<CR>', { desc = 'Luasnip jump prev' })
set('s', '<C-l>', '<CMD>lua require("luasnip").jump(1)<CR>', { desc = 'Luasnip jump next' })
set('s', '<C-h>', '<CMD>lua require("luasnip").jump(-1)<CR>', { desc = 'Luasnip jump prev' })

-- Quickfix list
set('n', '<C-n>', '<CMD>cnext<CR>', { desc = 'Quickfix next' })
set('n', '<C-p>', '<CMD>cprev<CR>', { desc = 'Quickfix prev' })
