<#
    install.ps1 - dotfiles 環境構築スクリプト
    目的: dotfiles の構成ファイルを所定の位置にリンクまたはコピーする

    実行方法:
        cd ~/dotfiles
        ./install.ps1
#>

$ErrorActionPreference = "Stop"

Write-Host "`n🛠 dotfiles install script start...`n"

# 1. 環境変数を設定
$env:DOTFILES_HOME = "$HOME\dotfiles"
$env:XDG_CONFIG_HOME = "$env:DOTFILES_HOME\xdg_config"

Write-Host "✅ DOTFILES_HOME set to: $env:DOTFILES_HOME"
Write-Host "✅ XDG_CONFIG_HOME set to: $env:XDG_CONFIG_HOME"

# 2. Git設定のリンク
Write-Host "`n🔗 Linking .gitconfig and .gitignore_global..."
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$env:DOTFILES_HOME\git\gitconfig" -Force
New-Item -ItemType SymbolicLink -Path "$HOME\.gitignore_global" -Target "$env:DOTFILES_HOME\git\gitignore_global" -Force

# 3. Windows Terminal 設定のリンク＋背景画像コピー
Write-Host "`n🎨 Setting up Windows Terminal config..."
$wtPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$wtSettings = "$wtPath\settings.json"
$dotfileWT = "$env:DOTFILES_HOME\windows_terminal\settings.json"

# バックアップ & リンク
if (Test-Path $wtSettings) {
    Rename-Item $wtSettings "$wtSettings.bak" -Force
    Write-Host "🗂 WT settings.json backed up."
}
New-Item -ItemType SymbolicLink -Path $wtSettings -Target $dotfileWT -Force
Write-Host "🔗 Linked settings.json to Windows Terminal."

# 背景画像コピー
$assetsSource = "$env:DOTFILES_HOME\windows_terminal\assets\*"
Copy-Item $assetsSource -Destination $wtPath -Force
Write-Host "🖼 Background images copied."

# 4. 今後の拡張ポイント（PowerShellやVSCodeなど）
Write-Host "`n📦 Ready for future extensions (PowerShell, VSCode, etc.)"

Write-Host "`n✅ dotfiles setup complete!`n"

