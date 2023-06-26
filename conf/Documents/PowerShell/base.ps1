Set-Alias time Measure-Command # eg: time { Get-Command echo }
Set-Alias vim nvim

# Easier Navigation: .., ..., ...., ....., and ~  更简单的导航:使用..,...和~
${function:~} = { Set-Location ~ }
# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ../.. }
${function:....} = { Set-Location ../../.. }
${function:.....} = { Set-Location ../../../.. }
${function:......} = { Set-Location ../../../../.. }
# Navigation Shortcuts
${function:dl} = { Set-Location ~/Downloads }
${function:doc} = { Set-Location ~/Documents }
# ${function:dt} = { Set-Location ~/Desktop }
# ${function:drop} = { Set-Location ~/Documents/Dropbox }

# Create a new directory and enter it 创建一个文件夹并进入
function New-AndSet-Directory([String] $path) { 
  New-Item $path -ItemType Directory -ErrorAction SilentlyContinue; Set-Location $path
}
Set-Alias mkd New-AndSet-Directory
# Determine size of a file or total size of a directory 确定文档的大小或目录的总大小
function Get-DiskUsage([string] $path=(Get-Location).Path) {
  Convert-ToDiskSize `
      ( `
          Get-ChildItem ./ -recurse -ErrorAction SilentlyContinue `
          | Measure-Object -property length -sum -ErrorAction SilentlyContinue
      ).Sum `
      1
}
Set-Alias fs Get-DiskUsage
# Convert a number to a disk size (12.4K or 5M) 将数字转换为磁盘大小（12.4K 或 5M）
function Convert-ToDiskSize {
  param ( $bytes, $precision='0' )
  foreach ($size in ("B","K","M","G","T")) {
      if (($bytes -lt 1000) -or ($size -eq "T")) {
          $bytes = ($bytes).tostring("F0" + "$precision")
          return "${bytes}${size}"
      }
      else { $bytes /= 1KB }
  }
}
Set-Alias bit Convert-ToDiskSize

# Download a file into a temporary folder 将文档下载到临时文档夹中
function Receive-Temp($url) {
  $uri = new-object system.uri $url
  $filename = $name = $uri.segments | Select-Object -Last 1
  $path = join-path $env:Temp $filename
  if( test-path $path ) { Remove-Item -force $path }

  (new-object net.webclient).DownloadFile($url, $path)

  return new-object io.fileinfo $path
}
Set-Alias curlex Receive-Temp



function Edit-Profile { 
  Invoke-Expression "$(if($null -ne $env:EDITOR) {$env:EDITOR } else { 'notepad' }) $profile" 
}
Set-Alias profile Edit-Profile
