# music: Open-MV / Open-MV v
function Open-MV($type) { 
  $mv_dir = "$home/asset_tel/tel/recreation/mv"
  if ($type -eq "v") {
    mpv --shuffle --border=no --volume=56 --geometry=100%:20% --autofit=20%x20% --ontop-level=system --ontop $mv_dir
  } else {
    mpv --no-video --shuffle --volume=56 $mv_dir
  }
}
${function:m} = { Open-MV }
${function:v} = { Open-MV v }