-- Space is leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Various vim settings
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Neovide is awesome
vim.opt.guifont = 'Menlo:h15'
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_trail_size = 0.3
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_vfx_mode = 'sonicboom'
vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_remember_window_size = true

-- Use system clipboard for unnamed register
vim.opt.clipboard = 'unnamedplus'

-- Enable undo history
vim.opt.undofile = true

vim.opt.swapfile = false

-- Line numbers
vim.wo.number = true

vim.opt.updatetime = 500

-- Special files
vim.filetype.add {
  filename = {
    Brewfile = 'ruby',
    ['.aliases'] = 'zsh',
    ['.variables'] = 'zsh',
  }
}
