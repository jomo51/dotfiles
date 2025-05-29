--nvim-cmpの設定関連
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP補完ソース
      "hrsh7th/cmp-buffer",   -- バッファ補完
      "hrsh7th/cmp-path",     -- パス補完
    },
    -- 設定呼び出しとセット
    config = function ()
      local cmp = require("cmp")

      cmp.setup({
        --候補ウィンドウ見た目
        window = {
          completion = cmp.config.window.bordered({
            scrollbar = true,
            --winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,PmenuSel:PmenuSel"
          }),
          documentation = cmp.config.window.bordered(),
        },
        --候補数
        performance = {
          max_view_entries = 15,
        },
        --キーマップ
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<TAB>"] = cmp.mapping.confirm({ select = true }),
          ["<ESC>"] = cmp.mapping.abort(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
        }),
        --補完対象
        sources = {
          {name = "nvim_lsp", priority = 1000},
          {name = "path", priority = 500},
          {name = "buffer", priority = 750},
        },
      })
    end
  }
}
