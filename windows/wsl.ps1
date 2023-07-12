. ./util.ps1

# Check to see if we are currently running "as Administrator"

# https://zhuanlan.zhihu.com/p/466001838
wsl --install
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2

# explorer https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi  # 如果有报错
# wsl --install -d Ubuntu
# Restart-Computer
