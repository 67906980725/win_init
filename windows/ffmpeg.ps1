. ./util.ps1

$ver = "6.0"
$name = "ffmpeg-$ver-full_build"
$zip_name = "${name}.zip"

dw_git_extract -url "https://github.com/GyanD/codexffmpeg/releases/download/$ver/$zip_name" -f_name "$zip_name"


Move-Item -Path $DOWN_PATH/$name -Destination $APP_PATH -Force
Rename-Item -Path $APP_PATH/$name -NewName ffmpeg -Force

