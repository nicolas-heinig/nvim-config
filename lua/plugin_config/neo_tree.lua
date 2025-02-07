vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.fn.sign_define(
  'DiagnosticSignError', {
    text = ' ',
    texthl = 'DiagnosticSignError'
  }
)

vim.fn.sign_define(
  'DiagnosticSignWarn', {
    text = ' ',
    texthl = 'DiagnosticSignWarn'
  }
)

vim.fn.sign_define(
  'DiagnosticSignInfo', {
    text = ' ',
    texthl = 'DiagnosticSignInfo'
  }
)

vim.fn.sign_define(
  'DiagnosticSignHint', {
    text = '󰌵',
    texthl = 'DiagnosticSignHint'
  }
)

require('neo-tree').setup {
  event_handlers = {
    {
      event = 'file_added',
      handler = function(arg)
        vim.cmd('edit ' .. arg)
      end
    },
  },
  default_component_configs = {
    file_size = {
      enabled = false,
      required_width = 64, -- min width of window required to show this column
    },
    type = {
      enabled = false,
    },
    last_modified = {
      enabled = false,
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      never_show = {
        '.DS_Store',
        '.git',
      },
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
    use_libuv_file_watcher = true,
  },
}

vim.keymap.set('n', '<c-b>', ':Neotree toggle<cr>', { desc = 'Toggle neo-tree' })
