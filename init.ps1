if ($IsWindows) {
  Set-Location ./windows
  ./init_windows.ps1
  Pop-Location
} elseif ($IsLinux) {
  Set-Location ./linux
  ./init_linux.ps1
  Pop-Location
}
