$GITHUB_PROXY = "https://cors.isteed.cc/"
$PATH_SEPARATOR = [System.IO.Path]::DirectorySeparatorChar
$DOWN_PATH = "${home}${PATH_SEPARATOR}Downloads"
$I_APP_PATH = "${home}${PATH_SEPARATOR}.local${PATH_SEPARATOR}app"
function cp_conf($path) { 
  $p_dir = Split-Path -parent $home/$path
  Copy-Item -Path ../conf/$path -Destination $p_dir -Recurse -Force
}
function dw_git {
  param (
    [string] $url,
    [string] $f_name
  )
  $l = "${GITHUB_PROXY}$url"
  Invoke-WebRequest $l -OutFile $DOWN_PATH/$f_name
}
function dw_git_extract {
  param (
    [string] $url,
    [string] $f_name,
    [string] $dir_name
  )
  dw_git -url $url -f_name $f_name
  Expand-Archive -Force -Path $DOWN_PATH/$f_name -DestinationPath $DOWN_PATH/$dir_name
  Remove-Item $DOWN_PATH/$f_name
}
