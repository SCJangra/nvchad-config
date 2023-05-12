local opt = vim.opt

local on_attach = require('plugins.configs.lspconfig').on_attach
local capabilities = require('plugins.configs.lspconfig').capabilities

local lspconfig = require 'lspconfig'

local settings = require 'custom.configs.lspconfig.settings'
local utils = require 'custom.utils'

local navic = require 'nvim-navic'

-- if you just want default config for the servers then put them in a table
local servers = {
  { name = 'rust_analyzer', formatting = true },
  { name = 'tsserver',      formatting = false },
  { name = 'bashls',        formatting = true },
}

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

for _, s in ipairs(servers) do
  lspconfig[s.name].setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
        opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
      end

      if s.formatting then
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true

        utils.setup_auto_format(client, bufnr)
      end
    end,
    capabilities = capabilities,
    settings = settings[s.name],
  }
end
