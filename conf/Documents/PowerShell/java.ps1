function Restore-Maven-Repo {
  Get-ChildItem -Path $home/.m2/repository -Recurse -Filter *.lastUpdated | Remove-Item -Force
}
Set-Alias clean_maven Restore-Maven-Repo
