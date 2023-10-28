Install-Module posh-git -Scope CurrentUser -Force -ErrorAction Stop
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck -ErrorAction Stop
Install-Module -Name Terminal-Icons -Repository PSGallery -Force -ErrorAction Stop

$file_dir = Split-Path -Parent $PSCommandPath
Invoke-Expression $file_dir/cp_pwsh_conf.ps1