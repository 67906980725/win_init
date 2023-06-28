
"base", "pwsh", "git", "ssh", "rust", "node", "java", "recreation", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". ./$_.ps1" }

if ($IsWindows) {
  Push-Location("./windows")
  "base", "env", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". ./$_.ps1" }
  Pop-Location
}
