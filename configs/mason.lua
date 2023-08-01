local opts = {
  ensure_installed = {
    'lua-language-server',
    'stylua',
    'rust-analyzer',
    'typescript-language-server',
    'bash-language-server',
    'json-lsp',
    'prettierd',
  },
}

return {
  'williamboman/mason.nvim',
  opts = opts,
}
