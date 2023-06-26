### Environment functions
### ----------------------------

# Reload the $env object from the registry
function Initialize-Environment {
  $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
               'HKCU:\Environment'

  $locations | ForEach-Object {
      $k = Get-Item $_
      $k.GetValueNames() | ForEach-Object {
          $name  = $_
          $value = $k.GetValue($_)
          Set-Item -Path Env:\$name -Value $value
      }
  }

  $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Set a permanent Environment variable, and reload it into $env
function Set-Environment([String] $variable, [String] $value) {
  Set-ItemProperty "HKCU:\Environment" $variable $value
  # Manually setting Registry entry. SetEnvironmentVariable is too slow because of blocking HWND_BROADCAST
  #[System.Environment]::SetEnvironmentVariable("$variable", "$value","User")
  Invoke-Expression "`$env:${variable} = `"$value`""
}

# Add a folder to $env:Path
function Add-EnvPath([String]$path) {
  $env:PATH = $env:PATH + ";$path"
}
function Add-EnvPath-IfExists([String]$path) { 
  if (Test-Path $path) {
    Add-EnvPath $path
  }
}