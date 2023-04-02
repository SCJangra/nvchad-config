local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.stylua,
  b.formatting.prettierd,
  b.formatting.rustfmt.with {
    extra_args = { '--edition=2021' },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { buffer = bufnr }
        end,
      })
    end
  end,
}
