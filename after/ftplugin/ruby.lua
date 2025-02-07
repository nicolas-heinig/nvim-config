vim.keymap.set(
  'n',
  '<leader>t',
  function()
    local current_file = vim.fn.expand('%:p')
    local corresponding_file

    -- Detect if it's a source or test file
    if current_file:match('_spec%.') then
      corresponding_file = current_file:gsub('spec/', 'app/'):gsub('spec/lib/', 'lib/'):gsub('_spec%.', '.')
    else
      corresponding_file = current_file:gsub('app/', 'spec/'):gsub('lib/', 'spec/lib/'):gsub('%.%w+$', '_spec%0')
    end

    vim.cmd('edit ' .. corresponding_file)
  end,
  { desc = 'Spec opener' }
)
