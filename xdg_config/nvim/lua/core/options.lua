--基本設定

--エンコード
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

--タブとインデント
vim.o.ambiwidth = 'double'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

--表示
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.showmatch = true    --対応カッコ表示
vim.o.visualbell = true
vim.o.splitbelow = true   --Splitしたときに下に開く


--コマンドとメニュー
vim.o.showcmd = true    --コマンド表示
vim.o.cmdheight = 1     --コマンド表示行
vim.o.laststatus = 2    --ステータスライン表示
vim.o.wildmenu = true   --コマンド補完

--file
vim.o.undofile = false
vim.o.swapfile = false

--cursor
vim.o.ruler = true
vim.o.cursorline = true

--search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

--terminal
vim.o.shell = "pwsh"

--カラースキーム
vim.o.termguicolors = true

