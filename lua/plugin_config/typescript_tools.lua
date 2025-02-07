local api = require("typescript-tools.api")
require('typescript-tools').setup {
  handlers = {
    ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
      {
        2306, -- XX is not a module
        7016, -- Cannot find declaration file
        80001 -- CommonJS module
      }
    ),
  },
  settings = {
    expose_as_code_action = 'all',
    tsserver_format_options = {
      insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
    },
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    }
  }
}
