
# Directory Listing: Use `ls.exe` if available 如果有ls.exe的话使用ls.exe
if (Get-Command ls.exe -ErrorAction SilentlyContinue | Test-Path) {
  Remove-Item alias:ls -ErrorAction SilentlyContinue
  # Set `ls` to call `ls.exe` and always use --color
  ${function:ls} = { ls.exe --color @args }
  # List all files in long format
  ${function:l} = { ls -lF @args }
  # List all files in long format, including hidden files
  ${function:la} = { ls -laF @args }
  # List only directories
  ${function:lsd} = { Get-ChildItem -Directory -Force @args }
} else {
  # List all files, including hidden files
  ${function:la} = { ls -Force @args }
  # List only directories
  ${function:lsd} = { Get-ChildItem -Directory -Force @args }
}

function Get-REAL-PATH($path) {
  Resolve-Path -Path $path
}
Set-Alias realpath Get-REAL-PATH
function Get-Parent-Path($path) {
  $p=Get-REAL-PATH($path)
  Split-Path -Path $p -Parent
}
Set-Alias dirname Get-Parent-Path
function New-File($file) { 
  "" | Out-File $file -Encoding ASCII -Append
}
Set-Alias touch New-File


# package manager 包管理
function Search-Winget { winget search @args }
Set-Alias search Search-Winget
function Update-Winget { winget update @args }
Set-Alias update Update-Winget
function Install-Winget { winget install @args }
Set-Alias install Install-Winget
function Remove-Winget { winget remove @args }
Set-Alias remove Remove-Winget
function Get-Command-Definition($name) {
  Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition 
}
Set-Alias which Get-Command-Definition
function Update-System() {
  Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll
  Update-Module
  Update-Help -Force
  winget update -r
}
Set-Alias sysup Update-System


# Reload the Shell, not working.. 重新加载shell 无效
function Initialize-Powershell {
  . $home/Documents/PowerShell/profile.ps1
}
Set-Alias reload Initialize-Powershell


# su & sudo
function Open-Admin-Shell { Start-Process pwsh -Verb runAs }
Set-Alias su Open-Admin-Shell
function Invoke-As-Admin() {
  if ($args.Length -eq 1) {
      start-process $args[0] -verb "runAs"
  }
  if ($args.Length -gt 1) {
      start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
  }
}
Set-Alias sudo Invoke-As-Admin


# Cleanup all disks(drives) old files (Based on Registry Settings in `windows.ps1`) 清理所有磁盘(驱动器)的旧文档（基于“windows.ps1”中的注册表设置）
function Optimize-Disks {
    Start-Process "$(Join-Path $env:WinDir 'system32\cleanmgr.exe')" -ArgumentList "/sagerun:6174" -Verb "runAs"
}
Set-Alias cleandisks Optimize-Disks
# Empty the Recycle Bin on all drives 清空所有驱动器上的回收站
function Clear-RecycleBin {
  $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
  $RecBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Confirm:$false }
}
Set-Alias emptytrash Clear-RecycleBin


# Correct PowerShell Aliases if tools are available (aliases win if set) 如果工具可用，请更正 PowerShell 别名（如果设置了别名，则以别名为准）
# WGet: Use `wget.exe` if available
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path) {
  Remove-Item alias:wget -ErrorAction SilentlyContinue
}
# curl: Use `curl.exe` if available
if (Get-Command curl.exe -ErrorAction SilentlyContinue | Test-Path) {
  Remove-Item alias:curl -ErrorAction SilentlyContinue
  # Set `ls` to call `ls.exe` and always use --color
  ${function:curl} = { curl.exe @args }
  # Gzip-enabled `curl`
  ${function:gurl} = { curl --compressed @args }
} else {
  # Gzip-enabled `curl`
  ${function:gurl} = { curl -TransferEncoding GZip }
}


# Common Editing needs
function Edit-Hosts { 
  Invoke-Expression "sudo $(if($null -ne $env:EDITOR)  {$env:EDITOR } else { 'notepad' }) $env:windir\system32\drivers\etc\hosts" 
}
Set-Alias hosts Edit-Hosts