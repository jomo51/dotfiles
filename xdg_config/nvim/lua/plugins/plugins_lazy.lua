return{
  -- colorshceme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },

  -- file browser
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        position = "right",
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
    cmd = "Neotree",
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    event = "VeryLazy",
  },

  --tabline
  {
    "kdheepak/tabline.nvim" ,
    opts = {} ,
    event = "BufWinEnter",
  },

  --indent
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "| ",
    },
    event = "BufRead",
  },

  -- nvim-treesitter
  --{
  --  "nvim-treesitter/nvim-treesitter",
  --  event = { "BufRead", "BufNewFile", "InsertEnter" },
  --  build = ":TSUpdate",
  --  config = function()
  --    local configs = require("nvim-treesitter.configs")
  --    configs.setup({
  --      ensure_installed = {
  --        "awk",
  --        "bash",
  --        "comment",
  --        "c",
  --        "css",
  --        "csv",
  --        "diff",
  --        "gpg",
  --        "html",
  --        "htmldjango",
  --        "javascript",
  --        "json",
  --        "lua",
  --        "markdown",
  --        "python",
  --        "rust",
  --        "sql",
  --        "ssh_config",
  --        "tmux",
  --        "toml",
  --        "vim",
  --        "xml",
  --        "yaml",
  --        "regex",
  --        "vimdoc",
  --      },
  --      sync_install = false,
  --      auto_install = true,
  --      highlight = { enable = true },
  --      indent = { enable = true },
  --    })
  --  end,
  --},
}
