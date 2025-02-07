local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  'marko-cerovac/material.nvim',             -- Theme
  'nvim-tree/nvim-web-devicons',             -- Nice icons
  'nvim-lualine/lualine.nvim',               -- Status line
  'tpope/vim-fugitive',                      -- Git integration
  'L3MON4D3/LuaSnip',                        -- Snippets
  'rafamadriz/friendly-snippets',            -- Snippets for completion
  'ray-x/guihua.lua',                        -- GUI library
  'nvim-telescope/telescope-ui-select.nvim', -- Use telescope for various pickers
  'mhartington/formatter.nvim',

  {                                                -- Treesitter
    'nvim-treesitter/nvim-treesitter',             -- Better code highlighting
    'windwp/nvim-ts-autotag',                      -- Autotag
    'nvim-treesitter/nvim-treesitter-textobjects', -- Additional text objects via treesitter
    'RRethy/nvim-treesitter-endwise',              -- Smart 'end'
    'nvim-treesitter/playground',                  -- Checkout highlighting groups
  },

  {
    'hrsh7th/nvim-cmp',          -- Completion
    'hrsh7th/cmp-nvim-lsp',      -- LSP stuff for completion
    'hrsh7th/cmp-buffer',        -- Completion based on buffer
    'saadparwaiz1/cmp_luasnip',  -- Snippets for completion
    'FelipeLema/cmp-async-path', -- File System Paths
    'chrisgrieser/cmp_yanky',    -- Yank History
    'ray-x/cmp-treesitter',      -- Treesitter nodes
  },

  { -- LSPs
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },

  { -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    }
  },

  { -- File tree
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },

  { -- Key manual
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {}
  },

  { -- Git indicators
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  { -- Go configuration
    'ray-x/go.nvim',
    config = function()
      require('go').setup()
    end
  },

  { -- OTP for autoclose, comment, moves
    'echasnovski/mini.nvim',
    config = function()
      require('mini.comment').setup()
      require('mini.move').setup()
      require('mini.pairs').setup {
        mappings = {
          ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
          ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
        }
      }
    end
  },

  { -- Surround functionality
    'kylechui/nvim-surround',
    version = '*',
    config = function()
      require('nvim-surround').setup()
    end
  },
  { -- Awesome yank features
    'gbprod/yanky.nvim',
    opts = {},
  },
  { -- Copilot
    {
      'zbirenbaum/copilot.lua',
      cmd = "Copilot",
      event = "InsertEnter",
    },
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end
    }
  },
  {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  },
}

require('lazy').setup(plugins, {})
