
"base", "pwsh", "path", "git", "git_alias", "ssh", "ffmpeg", "rust", "node", "java", "recreation", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". ./$_.ps1" }

if ($IsWindows) {
  # 允许执行本地脚本 (用户身份和管理员身份需要各自设置)
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force
  Push-Location("./windows")
  "base", "env", "proxy", "extra" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". ./$_.ps1" }
  Pop-Location
}
