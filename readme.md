# dotfiles for WSL and PWSH

WSLの設定とTerminalの設定とPWSHの設定、、、、

## 対応環境と機能概要

- WSL(Ubuntu22.04) Zsh/Starship/Neovim
- PWSH(7~) Vscode/terminal/neovim

## WSL,pwsh共用として設定されるもの

- nvim  <- 複雑・重要
- gitconfig類

## WSL セットアップ

### 前提条件

- ubuntu22.04(LTS)
- WSL2

### インストール手順

1. リポジトリクローン

```bash
git clont https://github.com/jomo51/dofiles.git ~/dotfiles
```

2. install.shでリンクを作成

```bash
./install.sh
```

3. (option)初期設定時は環境導入

```bash
./wsl_setup.sh
```

### 自動設定される内容



## pwsh セットアップ

### 前提条件

以下のアプリは必須

- WindowsTerminal
- VSCode
- pwsh 7 以降
- Git

### インストール手順

** ソフトリンクを貼るので必ず管理権限で実行すること**

PWSHで以下を実行

```pwsh
git clone https://github.com/yourname/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
./install.ps1
```

### 自動設定される内容

- Git設定 (メールアドレスとかは自身で設定すること)
- Powershellプロファイルとoh-my-posh
- VSCode設定と拡張機能
- WindowsTerminal背景画像・プロファイル
- Neovimインストールチェック(LAZY付き)
- PowershellEditorService(v4.3.0)の取得
- PowerShellモジュール

## 補足：NVIMの構成と運用について

- WSL/pwshで共通設定(`xdg_config/nvim/`)
- init.luaがエントリーポイント
- プラグイン管理はLazyで
- プロファイルはディレクトリ構成
- pwshでの実行はpwsh対応のLSPも読み込む(`Plugins/lsp/powershell.lua`)
- WSLのneovimはppaを追加して最新版をapt
- pwshでは`install.ps1`でなければ導入。WSLでは`wsl_setup.sh`に含まれる

## 補足：ディレクトリ構成(抜粋)

```text
dotfiles/
├── install.sh                  # WSL用セットアップスクリプト
├── install.ps1                # Windows PowerShell用セットアップスクリプト
├── wsl_setup.sh               # WSL初期構築用スクリプト
├── git/
│   ├── gitconfig
│   └── gitignore_global
├── os/
│   └── wsl/
│       ├── zshrc
│       └── zshrc.bkp_default
├── powershell/
│   ├── profile.ps1
│   └── theme.omp.json
├── vscode/
│   ├── extensions.txt
│   ├── keybindings.json
│   └── settings.json
├── windows_terminal/
│   ├── assets/
│   └── settings.json.template
├── tools/
│   └── PSES/   #<-このディレクトリはPWSHのみでignoreされている
└── xdg_config/
    ├── starship.toml
    ├── gh/
    ├── nvim/
    │   ├── init.lua
    │   └── lua/
    │       ├── config/
    │       ├── core/
    │       ├── plugins/
    │       └── user/
    └── rest-client/
```

## 注意事項

- WindowsTerminalではsetting.json.templateをベースにユーザー環境に合わせたパスを動的に書き換え
    - 背景画像が存在しない場合は失敗するかも

- starshipはaptではなく手動インストール

- Neovimの設定はlazy.nvimでWSL/pwsh共通構成

- リンク作成前にバックアップを作成する。。。。多分

## TODO

- toolsの整理と統合運用

