local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]],
  desc = 'Trim trailing whitespace'
})

autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { timeout = 50, on_macro = true }
  end,
  desc = 'Highlight yanked text',
})

autocmd('Filetype', {
  pattern = 'help',
  command = [[wincmd L]],
  desc = 'Open help files in vertical split',
})
