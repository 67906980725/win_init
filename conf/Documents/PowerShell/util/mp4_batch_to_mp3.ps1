param(
  [string]$dir
)

function mp4_to_mp3($file, $out_dir){
  $filename = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
  $outputFile = Join-Path -Path $out_dir -ChildPath "${filename}.mp3"
  $command = "${home}\AppData\Roaming\bilibili\ffmpeg\ffmpeg.exe -i ""$($file.FullName)"" ""$outputFile"""
  Invoke-Expression $command
}


$mp4Files = Get-ChildItem -Path $dir -Filter "*.mp4" -File
$out_dir = "${dir}_mp3"
New-Item "$out_dir" -ItemType Directory -ErrorAction SilentlyContinue 
foreach ($file in $mp4Files) {
  mp4_to_mp3 $file $out_dir
}
