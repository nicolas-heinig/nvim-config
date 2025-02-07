require('copilot').setup {
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-l>",
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
