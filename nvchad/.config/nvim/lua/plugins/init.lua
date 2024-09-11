return {
  {
    "mbbill/undotree", lazy = false
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end
  },
  {
  'rmagatti/auto-session', lazy = false,
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }
  end
  },
  {
  'linux-cultist/venv-selector.nvim', lazy = true,
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    -- Your options go here
    -- name = "venv"
    name = {"venv", ".venv", "env"}
    -- auto_refresh = false
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>vs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
  }
  },
  {
  "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp" ,
        "prettier",
        "ruff-lsp",
        "ruff",
        "debugpy",
        "pyright",
        "flake8",
        "black",
        "autopep8"
      },
    },
   },
  {
  "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
       "html", "css"
      },
    },
  },
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    config = {
    startVisible = true,
    showBlankVirtLine = true,
    highlightColor = { link = "Comment" },
    hints = {
         Caret = { text = "^", prio = 2 },
         Dollar = { text = "$", prio = 1 },
         MatchingPair = { text = "%", prio = 5 },
         Zero = { text = "0", prio = 1 },
         w = { text = "w", prio = 10 },
         b = { text = "b", prio = 9 },
         e = { text = "e", prio = 8 },
         W = { text = "W", prio = 7 },
         B = { text = "B", prio = 6 },
         E = { text = "E", prio = 5 },
    },
    gutterHints = {
        G = { text = "G", prio = 10 },
        gg = { text = "gg", prio = 9 },
        PrevParagraph = { text = "{", prio = 8 },
        NextParagraph = { text = "}", prio = 8 },
      }
    },
  },
  {
      "OXY2DEV/markview.nvim",
      lazy = false,      -- Recommended
      -- ft = "markdown" -- If you decide to lazy-load anyway

      dependencies = {
          -- You will not need this if you installed the
          -- parsers manually
          -- Or if the parsers are in your $RUNTIMEPATH
          "nvim-treesitter/nvim-treesitter",

          "nvim-tree/nvim-web-devicons"
      }
  }
}
