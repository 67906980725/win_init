param(
  [string]$dir
)

function mp4_to_mp3($file) {
  $parent_dir = Split-Path -parent $file
  $out_dir = "${parent_dir}_mp3"
  New-Item "$out_dir" -ItemType Directory -ErrorAction SilentlyContinue
  
  $filename = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
  $outputFile = Join-Path -Path $out_dir -ChildPath "${filename}.mp3"
  $command = "ffmpeg -i ""$($file.FullName)"" ""$outputFile"""
  Invoke-Expression $command
}


$mp4Files = Get-ChildItem -Path $dir -Filter "*.mp4" -File -Recurse
foreach ($file in $mp4Files) {
  mp4_to_mp3 $file $out_dir
}
