local prettierd = require('formatter.defaults').prettierd

require('formatter').setup {
  filetype = {
    css = { prettierd },
    javascript = { prettierd },
    javascriptreact = { prettierd },
    typescript = { prettierd },
    typescriptreact = { prettierd },
  }
}

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = {
    '*.css',
    '*.js',
    '*.jsx',
    '*.ts',
    '*.tsx'
  },
  command = [[FormatWrite]],
  desc = 'Use prettierd for formatting files that are not formatted by LSP'
})
