local cmp = require('cmp')
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  KeywordFunction = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}
local default_icon = ""

cmp.setup {
  formatting = {
    format = function(_, vim_item)
      local icon = kind_icons[vim_item.kind] ~= nil and kind_icons[vim_item.kind] or default_icon

      vim_item.kind = string.format('%s %s', icon, vim_item.kind)

      -- vim_item.menu = string.format('%s', entry.source.name) -- For debugging
      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Selection },
    ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Selection },
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip',                 dup = 0 },
    { name = 'async_path',              dup = 0 },
    { name = 'nvim_lsp_signature_help', dup = 0 },
    { name = 'treesitter',              dup = 0 },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      },
      dup = 0,
      max_item_count = 10,
    },
    {
      name = 'cmp_yanky',
      onlyCurrentFiletype = true,
      minLength = 6,
      dup = 0
    },
  },
}
