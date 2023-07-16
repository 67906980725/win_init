$seconds = 86400 # 一天
$cnt = $args[0]

function task() {
  pwsh $APP_PATH/aria2/update_bt_tracker.ps1
}

if (!$cnt -or ($cnt % $seconds) -eq 0) {
  "[$(Get-Date)] $($MyInvocation.MyCommand.Name) begin"
  task
  "[$(Get-Date)] $($MyInvocation.MyCommand.Name) end"
}