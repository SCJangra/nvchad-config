local api = vim.api
local format = vim.lsp.buf.formatting_sync

local Utils = {}

function Utils.set_format_on_save(client, bufnr)
  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    callback = function()
      format(nil, nil)
    end,
  })
end

return Utils
