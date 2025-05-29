local vim = vim
-- <leader>はnvim配下のinit.luaに設定
-- ------------------------------------------------------------------------------
-- キーマップ設定（vim.keymap.set）
--
-- 構文: vim.keymap.set({モード}, {押すキー}, {動作}, {オプション})
--
-- 【モード】例:
--   "n"  = ノーマルモード
--   "i"  = インサートモード
--   "v"  = ビジュアルモード
--   "t"  = ターミナルモード
--   {"n", "v"} = 複数モードで有効
--
-- 【押すキー】例:
--   "<leader>e" → leaderキー（例: space）+ e
--   "<C-k>"     → Ctrl + k
--   "jj"        → 挿入モードでjjと打つ
--
-- 【動作】例:
--   ":Neotree toggle<cr>" → Neotreeトグル
--   "<ESC>"               → ESCキーに相当
--   function() ... end    → Lua関数も可
--
-- 【オプション】（任意）
--   noremap = true  → 再帰マップ防止（推奨）
--   silent  = true  → 実行メッセージ非表示
--   desc    = "..." → which-keyなどに表示する説明
--
-- 例:
-- vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>", {
--   noremap = true,
--   silent = true,
--   desc = "Neotree Toggle",
-- })
-- ------------------------------------------------------------------------------

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>", {
  noremap = true,
  silent = true,
  desc = "Neotree Toggle",
})


--vim.keymap.set("n", "nn", ":Neotree toggle<cr>", { noremap = true, silent = true, desc = "Neotree Toggle" })
--vim.keymap.set(
--    "n",
--    "no",
--    ":Neotree reveal<cr>:Neotree ~/dotfiles/nvim/<cr>",
--    { noremap = true, silent = true, desc = "Neotree reveal" }
--)
