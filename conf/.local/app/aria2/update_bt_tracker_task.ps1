$GITHUB_PROXY = $GITHUB_PROXY ?? "https://cors.isteed.cc/"
$PATH_SEPARATOR = [System.IO.Path]::DirectorySeparatorChar
$DOWN_PATH = $DOWN_PATH ?? "${home}${PATH_SEPARATOR}Downloads"

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

function update_bt_tracker {
  dw_git_extract -url "https://github.com/ngosang/trackerslist/archive/refs/heads/master.zip" -f_name "trackerslist.zip" -dir_name ""
  # $tks = (Get-Content "$DOWN_PATH/trackerslist-master/trackers_best.txt") | Where-Object { $_ -match '\S' }
  $tks = (Get-Content "$DOWN_PATH/trackerslist-master/trackers_all.txt") | Where-Object { $_ -match '\S' }
  $tks = $tks -join ","
  (Get-Content "$PSScriptRoot/aria2.conf") | Foreach-Object { $_ -replace '^bt-tracker=.*', "bt-tracker=$tks" } | Set-Content "$PSScriptRoot/aria2.conf"
}

while($true) {
  update_bt_tracker
  Start-Sleep -Seconds 3600 # 3600s
}