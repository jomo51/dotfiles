<#
install.ps1 - dotfiles 環境構築スクリプト
目的: dotfiles の構成ファイルを所定の位置にリンクまたはコピーする

実行方法:
cd ~/dotfiles
./install.ps1
#>

$ErrorActionPreference = "Stop"

Write-Host "`n🛠 dotfiles install script start...`n"

# シンボリックリンクの作成とバックアップの関数
function New-SymlinkWithBackup {
  param (
      [string] $Target,
      [string] $Link
      )

    //パスのチェックとバックアップ
    if (Test-Path $Link) {
      $backupPath = "$Link.bak"
        Rename-Item -Path $Link -NewName $backupPath -Force
        Write-Host "🗂 Backup created: $backupPath"
    }

  //親パスのチェックと再作成
  $parent = Split-Path -Parent $Link
    if (-not (Test-Path $parent)) {
      New-Item -ItemType Direcory -Path $Parent
    }

  //リンク作成
  New-Item -ItemType SymbolicLink -Path $Link -Target $Target -Force
    Write-Host "🔗 Linked: $Link → $Target" 
}


# 1. 環境変数を設定
$env:DOTFILES_HOME = "$HOME\dotfiles"
$env:XDG_CONFIG_HOME = "$env:DOTFILES_HOME\xdg_config"

Write-Host "✅ DOTFILES_HOME set to: $env:DOTFILES_HOME"
Write-Host "✅ XDG_CONFIG_HOME set to: $env:XDG_CONFIG_HOME"

# 2. Git設定のリンク
Write-Host "`n🔗 Linking .gitconfig and .gitignore_global..."
New-SymlinkWithBackup -Link "$HOME\\.gitconfig" -Target "$env:DOTFILES_HOME\\git\\gitconfig"
New-SymlinkWithBackup -Link "$HOME\\.gitignore_global" -Target "$env:DOTFILES_HOME\\git\\gitignore_global"

# 3. Windows Terminal 設定のリンク＋背景画像コピー
Write-Host "`n🎨 Setting up Windows Terminal config..."
$wtPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$wtSettings = "$wtPath\settings.json"
$dotfileWT = "$env:DOTFILES_HOME\windows_terminal\settings.json"
New-SymlinkWithBackup -Link $wtSettings -Target $dotfileWT

## 背景画像コピー
$assetsSource = "$env:DOTFILES_HOME\windows_terminal\assets\*"
Copy-Item $assetsSource -Destination $wtPath -Force
Write-Host "🖼 Background images copied."

# 4. PowetShellプロファイル
Write-Host "`n🧩 Linking PowerShell profile..."
$dotProfile = "$env:DOTFILES_HOME\\powershell\\Microsoft.PowerShell_profile.ps1"
New-SymlinkWithBackup -Link $PROFILE -Target $dotProfile

# 5. oh-my-posh 確認とテーマファイルチェック
Write-Host "`n🎩 Checking oh-my-posh..."
if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
  Write-Host "📦 Installing oh-my-posh via winget..."
    winget install JanDeDobbeleer.OhMyPosh -s winget
} else {
  Write-Host "✅ oh-my-posh already installed"
}

$poshTheme = "$env:DOTFILES_HOME\\powershell\\theme.omp.json"
if (-not (Test-Path $poshTheme)) {
  Write-Host "⚠️ theme.omp.json not found at $poshTheme"
} else {
  Write-Host "🎨 oh-my-posh theme file is ready"
}

# 6. VSCode設定
Write-Host "`n🧪 Linking VSCode settings..."
$vsUserDir = "$env:APPDATA\\Code\\User"
New-SymlinkWithBackup -Link "$vsUserDir\\settings.json" -Target "$env:DOTFILES_HOME\\vscode\\settings.json"
New-SymlinkWithBackup -Link "$vsUserDir\\keybindings.json" -Target "$env:DOTFILES_HOME\\vscode\\keybindings.json"

# 7. VSCode 拡張の再インストール
Write-Host "`n📦 Reinstalling VSCode extensions..."
$extensionsFile = "$env:DOTFILES_HOME\\vscode\\extensions.txt"
if (Test-Path $extensionsFile) {
  Get-Content $extensionsFile | ForEach-Object {
    code --install-extension $_
  }
  Write-Host "✅ Extensions installed."
} else {
  Write-Host "⚠️ No extensions.txt found."
}

Write-Host "`n✅ dotfiles setup complete!`n"

