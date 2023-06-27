if ($IsWindows) {
  Push-Location ./windows
  ./init_windows.ps1
} elseif ($IsLinux) {
  Push-Location ./linux
  ./init_linux.ps1
}
Pop-Location
