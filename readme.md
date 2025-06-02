# dotfiles

Widnows用環境構築

## セットアップ方法

- 以下のアプリは必須

    - Windows Terminal
    - VSCode
    - pwsh7~
    - git

1. pwshを管理権限で実行
```powershell
git clone https://github.com/jomo51/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles
./install.ps1
```

1. 以下の環境が自動セットアップ

- Git設定 (メールアドレスとかは自身で設定すること)
- Powershellプロファイルとoh-my-posh
- VSCode設定と拡張機能
- WindowsTerminal背景画像・プロファイル
- Neovimインストールチェック(LAZY付き)
- PowershellEditorService(v4.3.0)の取得
- PowerShellモジュール

1. ディレクトリ構成

```text
dotfiles/
├── git/
│   ├── gitconfig
│   └── gitignore_global
├── powershell/
│   ├── profile.ps1
│   └── theme.omp.json
├── vscode/
│   ├── settings.json
│   ├── keybindings.json
│   └── extensions.txt
├── windows_terminal/
│   ├── settings.json.template
│   └── assets/
└── tools/
    └── PSES/
```

## 注意事項

- WindowsTerminalだけはテンプレートから動的にパスを書き換え
    - 背景画像が存在しない場合、表示に失敗する

- PowerShellモジュールはInstall-Moduleで自動インストール

- シンボリックリンクを使う

- リンク作成前にバックアップ(.bak)を作成する。。。。たぶん

