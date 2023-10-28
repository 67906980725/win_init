# quickly connect to sshserver from config file lines 从配置文件选择ssh服务器连接
# eg: sshc / sshc ls / sshc 0 / sshc myphone
function Connect-Ssh-Server {
  param($p)

  # line content format: <alias_name:not ls> <user_name> <host> <port:22>
  # eg: myphone u0_a355 192.168.31.189 8022
  $conf_file = "$home/.ssh/ssh_server.txt"

  $names = New-Object System.Collections.Generic.List[string]
  $cmds = New-Object System.Collections.Generic.List[string]

  foreach($line in Get-Content $conf_file) {
    if(-not [string]::IsNullOrEmpty($line) -and -not $line.StartsWith("#")) {
      $tokens = $line.Split(" ")
      $name = $tokens[0]
      $user_name = $tokens[1]
      $host_name = $tokens[2]
      $port = $tokens[3] ?? 22
      $command = "ssh $user_name@$host_name -p $port"
      $names.Add($name)
      $cmds.Add($command)
    }
  }

  function _print_names {
    $names_order = for ($i=0; $i -lt $names.Count; $i++) {
      "$($i).$($names[$i])"
    }
    $names_order -join " "
  }

  $execute_cmd = $true
  if ([string]::IsNullOrEmpty($p)) {
    _print_names
    $selection = Read-Host "Enter the index of the server you want to connect"
    $cmd = $cmds[$selection]
  } elseif ("$p" -eq "ls") {
    _print_names
    $execute_cmd = $false
  } elseif ([int]::TryParse($p, [ref]$null)) {
    $cmd = $cmds[$p]
  } else {
    $cmd = $cmds[$names.IndexOf($p)]
  }
  # $cmd

  if ($execute_cmd) {
    Invoke-Expression $cmd
  }
}
Set-Alias sshc Connect-Ssh-Server
