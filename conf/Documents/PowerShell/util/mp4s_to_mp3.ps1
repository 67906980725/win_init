param(
  [string]$t, # 要转换的文件或文件夹
  [string]$o # 生成的文件或文件夹
)

function mp4_to_mp3($file, $out) {
  $command = "ffmpeg -i ""$($(Get-Item $file).FullName)"" ""$out"""
  "执行命令: $command"
  Invoke-Expression $command
}

function get_mp3_name_by_file($file) {
  $file_name = [System.IO.Path]::GetFileNameWithoutExtension($file)
  "$file_name.mp3"
}

function trans_dir($t, $o) {
  foreach ($file in $(Get-ChildItem -Path $t)) {
    $file_name = [System.IO.Path]::GetFileNameWithoutExtension($file)
    if ($file.PSIsContainer) {
      $new_o = "${o}/${file_name}"
      New-Item $new_o -ItemType Directory -ErrorAction SilentlyContinue
      trans_dir $file "${new_o}"
    }
    else {
      trans_file $file "$o"
    }
  }
}

function trans_file($t, $o) {
  mp4_to_mp3 $t "${o}/$(get_mp3_name_by_file $t)"
}

function trans_item($t, $o) {
  if ($(Get-Item $t).PSIsContainer) {
    New-Item $o -ItemType Directory -ErrorAction SilentlyContinue
    trans_dir $t $o
  }
  else {
    mp4_to_mp3 $t $o
  }
}


if (!$o) {
  if ($(Get-Item $t).PSIsContainer) {
    $o = "$($(Get-Item $t).Name)_mp3" 
  }
  else {
    $o = "$(Get-Location)/$(get_mp3_name_by_file $t)"
  }
}

trans_item $t $o
