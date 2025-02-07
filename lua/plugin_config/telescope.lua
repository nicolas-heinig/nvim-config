local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      'assets',
      '.git',
      'vendor'
    },
    dynamic_preview_title = true,
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('yank_history')
telescope.load_extension('ui-select')

local builtin = require('telescope.builtin')

local find_files = function()
  builtin.find_files({ hidden = true })
end

-- LSP specific keymaps go in on_attach in lsp_config.lua
vim.keymap.set('n', '<c-p>', find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>ff', find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, { desc = 'Show old files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep ' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Show help' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Show buffers' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume search' })
vim.keymap.set('n', '<leader>fy', telescope.extensions.yank_history.yank_history, { desc = 'Yank History' })

vim.keymap.set(
  'n',
  '<leader>fc',
  function()
    builtin.find_files({
      cwd = '~/.config/nvim',
      prompt_title = 'Search nvim config'
    })
  end,
  { desc = 'Search nvim config' }
)
