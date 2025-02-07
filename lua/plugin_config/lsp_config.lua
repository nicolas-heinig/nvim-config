require('mason').setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    'bashls',
    'gopls',
    'graphql',
    'jsonls',
    'lua_ls',
    'marksman',
    'rust_analyzer',
    'terraformls',
    'yamlls',
  },
}



local au_group = vim.api.nvim_create_augroup('UserLspConfig', {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = au_group,
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local function keymap_set(mode, binding, command, desc)
      vim.keymap.set(mode, binding, command, { buffer = ev.buf, desc = desc })
    end

    local telescope_builtin = require('telescope.builtin')

    keymap_set('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    keymap_set('n', 'gt', vim.lsp.buf.type_definition, 'Go to type definition')

    keymap_set('n', 'gd', telescope_builtin.lsp_definitions, 'Go to definition')
    keymap_set('n', 'gi', telescope_builtin.lsp_implementations, 'Go to implementation')
    keymap_set('n', 'gr', telescope_builtin.lsp_references, 'Show references')

    keymap_set('n', '<leader>fs', telescope_builtin.lsp_document_symbols, 'Show LSP document symbols')

    keymap_set('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
    keymap_set('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
    keymap_set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code Action')

    keymap_set('n', '<leader>e', telescope_builtin.diagnostics, 'Telescope diagnostics')
    keymap_set('n', '[d', vim.diagnostic.goto_prev, 'Go to prev diagnostic')
    keymap_set('n', ']d', vim.diagnostic.goto_next, 'Go to next diagnostic')

    keymap_set('n', '<leader>f',
      function()
        vim.lsp.buf.format { async = true }
      end,
      'Format'
    )

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      pattern = { '*' },
      group = au_group,
      callback = function() vim.diagnostic.open_float(nil, { focus = false }) end
    })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*' },
  group = au_group,
  callback = function() vim.lsp.buf.format() end
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end,

  ['lua_ls'] = function()
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.stdpath 'config' .. '/lua'] = true,
            },
          },
        },
      }
    }
  end,

  ['solargraph'] = function()
    lspconfig.solargraph.setup {
      capabilities = capabilities,
      cmd = { '/Users/nicolas.heinig/.asdf/shims/solargraph', 'stdio' },
      settings = {
        solargraph = {
          diagnostics = false
        }
      }
    }
  end,

  ['bashls'] = function()
    lspconfig.bashls.setup {
      capabilities = capabilities,
      filetypes = { 'sh', 'zsh' }
    }
  end,

  ['ts_ls'] = function()
  end,
}
