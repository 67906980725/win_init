. $PSScriptRoot/../conf/Documents/Powershell/path.ps1
. $PSScriptRoot/../conf/Documents/Powershell/git.ps1

function cp_conf($path) { 
  $p_dir = Split-Path -parent $home/$path
  Copy-Item -Path $PSScriptRoot/../conf/$path -Destination $p_dir -Recurse -Force
}