# Disable the Progress Bar
$ProgressPreference='SilentlyContinue'

# Import-Module oh-my-posh
Import-Module posh-git
Import-Module -Name Terminal-Icons

# Get-PoshThemes
$poshthemes = $env:POSH_THEMES_PATH ?? "$home/.poshthemes"
oh-my-posh init pwsh --config "$poshthemes/clean-detailed.omp.json" | Invoke-Expression 

Set-PSReadLineOption -PredictionSource History # 预测文本来源为历史记录
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # Tab 命令行自动补全和提示
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete # Ctrl+d 菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 向上键后向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 向下键前向搜索历史纪录
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardKillLine # ctrl+u 清除开头到光标内容
Set-PSReadLineKeyHandler -Chord Ctrl+k -Function KillLine # ctrl+k 清除光标到结尾内容