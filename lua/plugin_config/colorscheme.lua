vim.opt.termguicolors = true
vim.g.material_style = 'darker'

local colors = require('material.colors')

require('material').setup {
  plugins = {
    'nvim-web-devicons',
    'telescope',
    'mini',
    'neo-tree',
    'nvim-cmp',
    'which-key',
  },

  lualine_style = 'stealth',

  custom_colors = function(colors_custom)
    colors_custom.editor.fg = '#FFFFFF'
    colors_custom.editor.bg = '#212121'
    colors_custom.syntax.type = colors.main.yellow
    colors_custom.git.modified = colors.main.yellow
  end,

  custom_highlights = {
    ['@keyword'] = {
      fg = colors.main.cyan,
      italic = true
    },
    ['@symbol'] = {
      fg = colors.main.cyan,
    },
    ['@keyword.conditional'] = {
      fg = colors.main.cyan,
      italic = true
    },
    ['@type.qualifier'] = {
      fg = colors.main.orange,
    },
    ['@property'] = {
      fg = colors.main.white,
    },
    ['@field'] = { fg = colors.main.white, },
    ['@label'] = {
      fg = colors.main.paleblue,
    },
    Identifier = {
      fg = colors.main.white,
    },
    ['@string.special.symbol'] = {
      fg = colors.main.cyan,
    },
    CmpItemKindCopilot = {
      fg = colors.main.cyan,
    },
    ['@variable.member.ruby'] = {
      fg = colors.main.purple,
    },
    ['@variable.global.ruby'] = {
      fg = colors.main.purple,
    },
    CmpItemKindText = {
      fg = colors.main.cyan,
    },
    CmpItemKindConstant = {
      fg = colors.main.yellow,
    },
    ['@markup.heading'] = {
      fg = colors.main.cyan,
    },
    ['@variable.member'] = {
      fg = colors.main.white,
    },
    NormalFloat = {
      bg = '#353434'
    }
  }
}

vim.cmd.colorscheme('material')
