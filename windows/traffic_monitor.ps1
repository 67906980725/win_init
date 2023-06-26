. ./util.ps1

install Microsoft.VCRedist.2015+.x64

# 下载文件
Invoke-WebRequest https://gitee.com/zhongyang219/TrafficMonitor/releases/download/V1.84.1/TrafficMonitor_V1.84.1_x64.zip -OutFile $home\.local\app\TrafficMonitor.zip

# 解压文件
Expand-Archive -Path $home\.local\app\TrafficMonitor.zip -DestinationPath $home\.local\app

# 创建一个快捷方式
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$home\.local\app\TrafficMonitor\TrafficMonitor.lnk")
$Shortcut.TargetPath = "$home\.local\app\TrafficMonitor\TrafficMonitor.exe"
$Shortcut.Save()

# 固定快捷方式到主屏幕
$shell = New-Object -ComObject "Shell.Application"
$folder = $shell.Namespace("$home\.local\app\TrafficMonitor")
$item = $folder.ParseName("TrafficMonitor.lnk")
$item.InvokeVerb("Pin to Start Menu")

cp_conf ".local\app\TrafficMonitor\config.ini"
Start-Process -FilePath "$home\.local\app\TrafficMonitor\TrafficMonitor.exe"
