../base/font.ps1
function install_font($dir_name) {
  Get-ChildItem -Path "$home/Downloads/$dir_name" -Filter *.ttf | ForEach-Object {
    Copy-Item $_.FullName $home/.local/fonts/
  }
}

$install_fonts | Where-Object { Test-Path "$home/Downloads/$_" } | ForEach-Object -process { install_font($_) }