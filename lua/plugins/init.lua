return {
  { -- LSP Configuration & Plugins
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      --Bridge for null-ls and mason
      "jose-elias-alvarez/null-ls.nvim",
      "jayp0521/mason-null-ls.nvim",

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },

  -- Pretty list of showing diagnostics
  "folke/trouble.nvim",

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',
  'navarasu/onedark.nvim', -- Theme inspired by Atom
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'theprimeagen/harpoon' },
  { 'mbbill/undotree' },
  { 'smartpde/telescope-recent-files' },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  -- File tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },

  -- copilot
  { "github/copilot.vim" },

  -- test & debugging
  {
    {
      "nvim-neotest/neotest",
      dependencies = {
        "haydenmeade/neotest-jest",
        "rouge8/neotest-rust",
        "nvim-neotest/neotest-plenary",
      },
    },
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    { "williamboman/nvim-dap-vscode-js", branch = "feat/debug-cmd" },
    "jbyuki/one-small-step-for-vimkind",
  },

  -- color convert_range_encoding
  'NTBBloodbath/color-converter.nvim',

}
