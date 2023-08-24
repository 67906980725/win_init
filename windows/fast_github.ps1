. ./util.ps1

$ver = "2.1.4"
$dir_name = "fastgithub_win-x64"
$zip_name = "${dir_name}.zip"

dw_git_extract -url "https://github.com/dotnetcore/FastGithub/releases/download/${ver}/${zip_name}" -f_name "$zip_name"
Move-Item -Path "$DOWN_PATH/$dir_name" -Destination $APP_PATH -Force

$install_dir = "$APP_PATH/$dir_name"
$l_file = "$install_dir/FastGithub.UI.lnk"
$l = (New-Object -ComObject WScript.Shell).CreateShortcut($l_file)
$l.WorkingDirectory = (Convert-Path $install_dir)
$l.TargetPath = (Convert-Path "$install_dir/FastGithub.UI.exe")
$l.Save()

Copy-Item -Path $l_file -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Force  

Start-Process -FilePath "$install_dir/FastGithub.UI.exe"
