$GITHUB_PROXY="https://js.xxooo.ml/"
function cp_conf($path) { 
  $p_dir = Split-Path -parent $home/$path
  Copy-Item -Path ../conf/$path -Destination $p_dir -Recurse -Force
}
function dw_git($url, $f_name) {
  Invoke-WebRequest ${GITHUB_PROXY}$url -OutFile $home/Downloads/$f_name
}
function dw_git_extract($url, $f_name, $dir_name) {
  dw_git($url, $f_name)
  Expand-Archive -Path $home/Downloads/$f_name -DestinationPath $home/Downloads/$dir_name
  Remove-Item $home/Downloads/$f_name
}
