#dotfilesのベース定義(USERPROFILE準拠)
$env:DOTFILES_HOME = "$HOME\dotfiles"
#XDGConfigの設定
$env:XDG_CONFIG_HOME = "$env:DOTFILES_HOME\xdg_config"
#Import-Module PSColor
Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -Colors @{
  inlineprediction = "#991167"
}
#PSReadLineKeyBind
Set-PSReadLineKeyHandler -Key "Ctrl+j" -Function NextHistory
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function PreviousHistory
Set-PSReadLineKeyHandler -Key "Ctrl+l" -Function ForwardWord
Set-PSReadLineKeyHandler -Key "Ctrl+s" -Function ClearScreen
Set-PSReadLineKeyHandler -Key "Ctrl+h" -Function BackwardWord
Set-PSReadLineKeyHandler -Key "Shift+Ctrl+h" -Function SelectBackwardWord
#alias
set-alias -Name ll -Value ls
set-alias -Name d -Value docker

#starship
#Invoke-Expression (&starship init powershell)

#oh-my-posh
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/quick-term.omp.json | Invoke-Expression 

#文字コード関係
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
Import-Module -Name Microsoft.WinGet.CommandNotFound

Import-Module -Name ZLocation

#gsudo登録
function sudo {gsudo $args}
