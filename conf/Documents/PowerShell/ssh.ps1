# quickly connect to sshserver from config file lines 从配置文件选择ssh服务器连接
# or quickly scp. eg: sshc, shc $home/foo /home/root/foo [-l]
# require: fzf
function Connect-Ssh-Server {
  param(
    [string] $local_path = "",
    [string] $remote_path = "",
    # if is pull from remote, add option: -l
    [switch] $l
  )

  # line content format: <alias_name:not ls> <user_name> <host> <port:22>
  # eg: myphone u0_a355 192.168.31.189 8022
  $conf_file = "$home/.ssh/ssh_server.txt"

  $names = New-Object System.Collections.Generic.List[string]
  $params_list = New-Object System.Collections.Generic.List[string]
  foreach($line in Get-Content $conf_file) {
    if(-not [string]::IsNullOrEmpty($line) -and -not $line.StartsWith("#")) {
      $tokens = $line.Split(" ", 2)
      $name = $tokens[0]
      $names.Add($name)
      $params = $tokens[1]
      $params_list.Add($params)
    }
  }

  $selected_name = $names | fzf
  $params = $params_list[$names.IndexOf($selected_name)]
  $tokens = $params.Split(" ")
  $user_name = $tokens[0]
  $host_name = $tokens[1]
  $port = $tokens[2] ?? 22

  if ([string]::IsNullOrEmpty($local_path) -and [string]::IsNullOrEmpty($remote_path)) {
    $command = "ssh $user_name@$host_name -p $port"
  } elseif ($l) {
    $command = "scp -P $port $user_name@$host_name`:$remote_path $local_path"
  } else {
    $command = "scp -P $port $local_path $user_name@$host_name`:$remote_path"
  }
  Invoke-Expression $command
  "执行的命令: $command"
}
Set-Alias sshc Connect-Ssh-Server