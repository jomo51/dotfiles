--リーダーキー
vim.g.mapleader = " "
--プラグインマネージャ設定
require("config.lazy")

require("core.options") --標準設定
require("core.autocmds") --自動実行コマンド
require("core.keymaps") --キーマップ
require("user.ui") --UI関連(見た目とか


