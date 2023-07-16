$pwsh_dir = Split-Path -parent $profile
. $pwsh_dir/path.ps1

$normal_sleep_time = 10
$first_sleep_time = $args[0] ?? 10
$crons_dir = "$home/.local/bin/crons"

Push-Location $crons_dir

function excute_one([String] $f, [int] $cnt) {
  pwsh $f $cnt
}

function taks([int] $cnt) {
  foreach ($f in Get-ChildItem) {
    & excute_one $f $cnt
  }
}

function cron {
  Start-Sleep -Seconds $first_sleep_time
  $cnt = $normal_sleep_time
  while ($true) {
    taks $cnt
    Start-Sleep -Seconds $normal_sleep_time
    $cnt += $normal_sleep_time
  }
}

taks
cron

Pop-Location