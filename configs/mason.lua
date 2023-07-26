local opts = {
  ensure_installed = {
    'lua-language-server',
    'stylua',
    'rust-analyzer',
    'typescript-language-server',
    'bash-language-server',
  },
}

return {
  'williamboman/mason.nvim',
  opts = opts,
}
