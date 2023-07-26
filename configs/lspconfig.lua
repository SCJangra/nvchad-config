local on_attach = require('plugins.configs.lspconfig').on_attach
local capabilities = require('plugins.configs.lspconfig').capabilities

local lspconfig = require 'lspconfig'

local settings = require 'custom.configs.lspconfig.settings'
local utils = require 'custom.utils'

-- if you just want default config for the servers then put them in a table
local servers = {
  { name = 'rust_analyzer', formatting = true },
  { name = 'tsserver', formatting = false },
  { name = 'bashls', formatting = true },
}

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

for _, s in ipairs(servers) do
  lspconfig[s.name].setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      require('lsp-inlayhints').on_attach(client, bufnr)

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
