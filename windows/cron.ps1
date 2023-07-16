. ./util.ps1

New-Item $BIN_PATH/crons -Force -ItemType Directory -ErrorAction SilentlyContinue

cp_conf ".local/bin/cron.ps1"

$l_file = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\cron.lnk"
  
$l = (New-Object -ComObject WScript.Shell).CreateShortcut($l_file)
$l.WorkingDirectory = "$BIN_PATH${PATH_SEPARATOR}crons"
$l.TargetPath = "pwsh.exe"
$l.Arguments = "-f $BIN_PATH/cron.ps1 10"
$l.Save()
