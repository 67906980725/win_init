. ./util.ps1
. ../base/font.ps1

function install_font($dir_name) {
  $fonts=(New-Object -ComObject Shell.Application).Namespace(20)
  Get-ChildItem -Path "$home/Downloads/$dir_name" -Filter *.ttf | ForEach-Object {
    $fonts.CopyHere($_.FullName)
  }
}

$install_fonts | Where-Object { Test-Path "$home/Downloads/$_" } | ForEach-Object -process { install_font($_) }

install DEVCOM.JetBrainsMonoNerdFont # https://ghdl.feizhuqwq.cf/https://github.com/DevelopersCommunity/wix-JetBrainsMonoNF/releases/download/v3.0.0/JetBrainsMono.msi