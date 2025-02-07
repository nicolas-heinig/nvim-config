local keymap_set_n = function(binding, desc, command)
  vim.keymap.set('n', binding, command, { desc = desc })
end

local keymap_set_v = function(binding, desc, command)
  vim.keymap.set('v', binding, command, { desc = desc })
end

-- Navigate vim panes better
keymap_set_n('<c-k>', 'Window up', ':wincmd k<CR>')
keymap_set_n('<c-j>', 'Window down', ':wincmd j<CR>')
keymap_set_n('<c-h>', 'Window left', ':wincmd h<CR>')
keymap_set_n('<c-l>', 'Window right', ':wincmd l<CR>')

-- Don't highlight search
keymap_set_n('<leader>h', 'nohlsearch', ':nohlsearch<CR>')

-- Copy file name with path
keymap_set_n('cp', 'Copy current filename', ':let @+ = expand("%")<cr>')

-- Faster write
keymap_set_n('<leader>w', 'Write file', ':w<CR>')

keymap_set_v(
  '<leader>f',
  'Telescope live grep for selection',
  function()
    vim.api.nvim_input('y')
    vim.api.nvim_input('<cmd> Telescope live_grep <CR>')
    vim.api.nvim_input('<c-r>')
    vim.api.nvim_input('0')
  end
)

keymap_set_n(
  '<leader>hl',
  'TSHighlightCapturesUnderCursor',
  ':TSHighlightCapturesUnderCursor<CR>'
)

keymap_set_n(
  '<leader>l',
  'Toggle relative line number',
  function()
    if vim.wo.relativenumber then
      vim.wo.relativenumber = false
      vim.wo.number = true
    else
      vim.wo.relativenumber = true
      vim.wo.number = false
    end
  end
)
