local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd({ 'BufRead' }, {
  once = true,
  pattern = '*.rs',
  callback = function()
    require('plenary.filetype').add_table {
      extension = {
        rs = 'rust',
      },
    }
  end,
})
