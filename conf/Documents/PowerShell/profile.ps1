$pwsh_dir = Split-Path -parent $profile
Push-Location($pwsh_dir)
"base", "pwsh", "git", "ssh", "rust", "node", "java", "recreation", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". ./$_.ps1" }
Pop-Location

if ($IsWindows) {
  Push-Location("$pwsh_dir/windows")
  "base", "env", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". ./$_.ps1" }
  Pop-Location
}
