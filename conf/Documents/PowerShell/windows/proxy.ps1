
# https://zhuanlan.zhihu.com/p/575159042

$internet_setting = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'

if ($internet_setting.ProxyEnable -eq 1) {
  $env:HTTP_PROXY = "http://$($internet_setting.ProxyServer)"
  $env:HTTPS_PROXY = "http://$($internet_setting.ProxyServer)"
  Write-Output "Proxy Enabled"
}
else{
  Remove-Item Env:\HTTP_PROXY -ErrorAction SilentlyContinue
  Remove-Item Env:\HTTPS_PROXY -ErrorAction SilentlyContinue
  # Write-Output "Proxy Disabled"
}

Remove-Variable -Name internet_setting