. ./util.ps1

# https://zhuanlan.zhihu.com/p/431557897

if (!(Test-Elevated)) {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = $myInvocation.MyCommand.Definition;
  $newProcess.Verb = "runas";
  [System.Diagnostics.Process]::Start($newProcess);

  exit
}

# 开启虚拟机平台
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Set-WinHomeLocation -GeoId 244 # 设置国家为美国

install 9P2JFQ43FPPG # APK Installers

explorer https://www.coolapk.com/ # 下载酷安

# 安装 wsa
#  用APK 安装程序打开 会提示下载 adb 和适用于 android 的 windows 子系统 
#  或以下命令?
Add-AppxPackage -Path MicrosoftCorporationII.WindowsSubsystemForAndroid_1.8.32822.0_neutral___8wekyb3d8bbwe.Msixbundle
#  老电脑商店不允许安装 wsa 的参考离线安装
#   教程 https://tsukkomi.org/post/bypass-the-limitation-to-install-windows-subsystem-for-android-aka-wsa
#   下载页 https://store.rg-adguard.net/  productId: 9P3395VX91NR  fast  最下边 MicrosoftCorporationII.WindowsSubsystemForAndroid_2304.40000.7.0_neutral_~_8wekyb3d8bbwe.msixbundle

# 打开适用于 android 的 windows 子系统 开发人员 开发人员模式
# 打开 apk 安装程序点启动 wsa 
# 在后台弹出的适用于 android 的 windows 子系统程序弹框允许 adb 调试(apk 安装程序一直在坐和放宽的时候)

# Set-WinHomeLocation -GeoId 45 # 完成之后设置国家为中国
