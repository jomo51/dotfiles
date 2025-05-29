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

  --カッコ補完
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  --lsp周りのやつ
  -- lua/plugins/plugins_lazy.lua
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("plugins.lsp.powershell").setup()
    end,
  },
}
