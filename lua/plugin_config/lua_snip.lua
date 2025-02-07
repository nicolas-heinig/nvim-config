require('luasnip.loaders.from_vscode').lazy_load()

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('ruby', {
  s('fslt', {
    t({ '# frozen_string_literal: true', '', '' }),
  }),
  s('rails_helper', {
    t({ 'require \'rails_helper\'', '', '' }),
  })
})

ls.add_snippets('typescriptreact', {
  s(
    {
      trig = 'arr',
      desc = 'Arrow function'
    }, {
      t('('),
      i(1),
      t({ ') => {', '}' }),
    }),
  s(
    {
      trig = 'tsc',
      desc = 'Add @tscheck'
    }, {
      t({ '// @ts-check', '' }),
    })
})

ls.filetype_extend('javascript', { 'typescriptreact' })
