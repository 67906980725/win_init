. ./util.ps1

$ver="12.3"
$f_name="FreeFileSync_${ver}_Windows_Setup.exe"

# Invoke-WebRequest https://freefilesync.org/download/$f_name -OutFile $home\Downloads\$f_name
Invoke-WebRequest ${GITHUB_PROXY}https://github.com/hkneptune/FreeFileSync/releases/download/$ver/v$f_name -OutFile $home\Downloads\$f_name
Start-Process -FilePath "$home\Downloads\$f_name"