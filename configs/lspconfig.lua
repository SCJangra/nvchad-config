local on_attach = require('plugins.configs.lspconfig').on_attach
local capabilities = require('plugins.configs.lspconfig').capabilities

local lspconfig = require 'lspconfig'

-- if you just want default config for the servers then put them in a table
local servers = {
  {
    name = 'rust_analyzer',
    formatting = true,
  },
  {
    name = 'tsserver',
    formatting = false,
  },
}

for _, s in ipairs(servers) do
  lspconfig[s.name].setup {
    on_attach = (not s.formatting) and on_attach or function (client, bufnr)
      on_attach(client, bufnr)

      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true

      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { buffer = bufnr }
        end,
      })
    end,
    capabilities = capabilities
  }
end
