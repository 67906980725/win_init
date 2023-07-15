$GITHUB_PROXY = "https://cors.isteed.cc/"

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
