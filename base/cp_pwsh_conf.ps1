$pwsh_dir = Split-Path -parent $profile
Copy-Item -Force ../conf/Documents/PowerShell/* $pwsh_dir/ 
