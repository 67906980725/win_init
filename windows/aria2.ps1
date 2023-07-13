. ./util.ps1

$install_dir = "$I_APP_PATH${PATH_SEPARATOR}aria2"


function install_aria2 {
  install aria2.aria2

  New-Item $install_dir -ItemType Directory -Force -ErrorAction SilentlyContinue
  "" | Out-File $install_dir/aria2.session -NoNewline
  cp_conf ".local/app/aria2/aria2.conf"
  (Get-Content "$install_dir/aria2.conf") | Foreach-Object { $_ -replace '^dir=.*', "dir=$DOWN_PATH"; } | Set-Content "$install_dir/aria2.conf"

  cp_conf ".local/app/aria2/update_bt_tracker.ps1"
  pwsh $install_dir/update_bt_tracker.ps1
}

function auto_start {
  $l_file = "$install_dir\aria2c.lnk"
  
  $l = (New-Object -ComObject WScript.Shell).CreateShortcut($l_file)
  $l.WorkingDirectory = $install_dir
  $l.TargetPath = "aria2c.exe"
  $l.Arguments = "--conf-path=aria2.conf"
  $l.Save()

  Copy-Item -Path $l_file -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Force  
}

function install_aria_ng {
  $ng_ver = "1.3.6"
  $ng_f_name = "AriaNg-$ng_ver-AllInOne.zip"
  dw_git_extract -url "https://github.com/mayswind/AriaNg/releases/download/$ng_ver/$ng_f_name" -f_name "$ng_f_name" -dir_name "aria_ng"

  Move-Item -Path $DOWN_PATH/aria_ng -Destination $I_APP_PATH -Force
  Rename-Item -Path $I_APP_PATH/aria_ng/index.html -NewName aria_ng.html -Force

  # 也可以用浏览器扩展接管aria2
  # https://microsoftedge.microsoft.com/addons/detail/aria2-explorer/jjfgljkjddpcpfapejfkelkbjbehagbh?hl=zh-CN  
}

function install_aria2_bak {
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
  (Get-Content "$install_dir/aria2.conf") | Foreach-Object { $_ -replace '^dir=.*', "dir=$DOWN_PATH"; } | Set-Content "$install_dir/aria2.conf"
}


install_aria2
auto_start
install_aria_ng

# https://www.cnblogs.com/alphaprime/p/15781824.html