. ./util.ps1

$install_dir = "$I_APP_PATH${PATH_SEPARATOR}aria2"

# require admin
function auto_start {
    $trigger = New-ScheduledTaskTrigger -AtStartup 
    $action = New-ScheduledTaskAction -Execute "$install_dir${PATH_SEPARATOR}aria2c.exe" -Argument "--conf-path=$install_dir${PATH_SEPARATOR}aria2.conf --input-file=$install_dir${PATH_SEPARATOR}aria2.session --save-session=$install_dir${PATH_SEPARATOR}aria2.session"
    Register-ScheduledTask -TaskName "aria2" -Trigger $trigger -Action $action
}

function install_aria2 {
  $ver = "1.36.0"
  $win64_dir = "aria2-$ver-win-64bit-build1"
  $win64_zip = "$win64_dir.zip"

  $d_name = $win64_dir
  $f_name = $win64_zip

  Invoke-WebRequest ${GITHUB_PROXY}https://github.com/aria2/aria2/releases/download/release-$ver/$f_name -OutFile $DOWN_PATH/$f_name

  Expand-Archive -Force -Path $DOWN_PATH/$f_name -DestinationPath $I_APP_PATH
  Rename-Item -Path $I_APP_PATH/$d_name -NewName aria2 -Force

  "" | Out-File $install_dir/aria2.session -NoNewline
  cp_conf ".local/app/aria2/aria2.conf"
  (Get-Content "$install_dir/aria2.conf") | Foreach-Object { $_ -replace '^dir=.*', "dir=$DOWN_PATH";  } | Set-Content "$install_dir/aria2.conf"
}

function install_aria_ng {
  $ng_ver = "1.3.6"
  $ng_f_name = "AriaNg-$ng_ver-AllInOne.zip"
  Invoke-WebRequest ${GITHUB_PROXY}https://github.com/mayswind/AriaNg/releases/download/$ng_ver/$ng_f_name -OutFile $DOWN_PATH/$ng_f_name
  Expand-Archive -Force -Path $DOWN_PATH/$ng_f_name -DestinationPath $install_dir
  Rename-Item -Path $install_dir/index.html -NewName aria_ng.html -Force
}

function update_bt_tracker {
  dw_git_extract -url "https://github.com/ngosang/trackerslist/archive/refs/heads/master.zip" -f_name "trackerslist.zip" -dir_name ""
  $tks = (Get-Content "$DOWN_PATH/trackerslist-master/trackers_best.txt") | Where-Object { $_ -match '\S' }
  $tks = $tks -join ","
  (Get-Content "$install_dir/aria2.conf") | Foreach-Object { $_ -replace '^bt-tracker=.*', "bt-tracker=$tks" } | Set-Content "$install_dir/aria2.conf"
}

install_aria2
install_aria_ng
update_bt_tracker
auto_start

# https://www.cnblogs.com/alphaprime/p/15781824.html