. ./util.ps1
. ../conf/Documents/PowerShell/env.ps1

# install Eassos.DiskGenius
# install 9P1WXPKB68KX # Snipaste 改截图快捷键
# install XPFFH613W8V6LV # obs studio 必要设置:视频输出改高级-mp4,调整输出大小（源大小）
# install GyDi.ClashVerge 
# install SyncTrayzor.SyncTrayzor
# install EuSoft.Eudic
# install XP9KLMLD6NRZC5 # 有道翻译
# install Alibaba.aDrive
# install Google.PlatformTools
# install Gyan.FFmpeg.Shared
# install Git.Git
# install Neovim.Neovim
# install junegunn.fzf
# install WinMerge.WinMerge
# install Microsoft.VCRedist.2015+.x64
# install Microsoft.VisualStudioCode
# install 9P3JFR0CLLL6 # mpv
# install Valve.Steam
# install XPDDVC6XTQQKMM # bilibili

# winget export --output ./export/winget.json
# winget search 9P1WXPKB68KX
install_import ./export/winget.json

# Make nvim the default editor
Set-Environment "EDITOR" "nvim --nofork"
Set-Environment "GIT_EDITOR" $Env:EDITOR

cp_conf AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe # terminal

cp_conf AppData/Roaming/Code/User/settings.json # vscode

install_local ./pkg/setup_ClickMonitorDDC_7_2.exe
cp_conf AppData/Roaming/ClickMonitorDDC # ctrl+alt+shift+{9/0/-/=} 调音量/亮度

./traffic_monitor.ps1
./free_file_sync.ps1

# explorer https://www.gyan.dev/ffmpeg/builds/ # ffmpeg