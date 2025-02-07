require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'material-stealth',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
        shorting_target = 120,
      }
    },
    lualine_c = {},
  },
  extensions = {
    'fzf',
    'lazy',
    'mason',
    'neo-tree',
    'quickfix',
  },
}
