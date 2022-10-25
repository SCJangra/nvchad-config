local set_format_on_save = require('custom.utils').set_format_on_save
local lsp_settings = require 'custom.plugins.lspconfig.settings'

local on_attach = require('plugins.configs.lspconfig').on_attach
local capabilities = require('plugins.configs.lspconfig').capabilities
local lspconfig = require 'lspconfig'

local fmt_on_save = {
  html = false,
  cssls = false,
  clangd = false,
  rust_analyzer = false,
  taplo = false,
  jsonls = false,
  sumneko_lua = false,
  cmake = false,
  tsserver = false,
  solc = false,
}

for name, fmt in pairs(fmt_on_save) do
  local config = {
    on_attach = (not fmt and on_attach) or function(client, bufnr)
      on_attach(client, bufnr)
      set_format_on_save(client, bufnr)
    end,
    capabilities = capabilities,
    settings = lsp_settings[name],
  }

  if name == 'sumneko_lua' then
    require('neodev').setup {
      override = function(_, library)
        library.enabled = true
        library.runtime = true
        library.types = true
        library.plugins = true
      end,
    }
  end

  if vim.g.started_by_firenvim and name == 'html' then
    config.filetypes = { 'html', 'text' }
  end

  if name == 'html' then
    config.filetypes = { 'html', 'markdown' }
  end

  lspconfig[name].setup(config)
end
