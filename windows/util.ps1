. ../base/util.ps1

function install($id) { winget install $args --silent --accept-package-agreements $id }
function install_import($path) { winget import -i $path }

function install_local($path) { Start-Process -ArgumentList ‘/s’ -PassThru -FilePath $path}

function Test-Elevated {
  # Get the ID and security principal of the current user account
  $myIdentity=[System.Security.Principal.WindowsIdentity]::GetCurrent()
  $myPrincipal=new-object System.Security.Principal.WindowsPrincipal($myIdentity)
  # Check to see if we are currently running "as Administrator"
  return $myPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}