# README

ref [jayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows)

## windows

winget install 9MZ1SNWT0N5D # install powershell
winget install 9MTCFHS560NG # install watt toolkit

press key win+x a (terminal(administrator)) 按快捷键win+x a (终端（管理员))

pwsh

``` pwsh
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

git clone --depth 1 git@github.com:67906980725/win_init.git
Set-Location ./win_init/windows
./init.ps1
```

## ubuntu

bash

``` bash
cd ./win_init/ubuntu
bash init.sh
cd ../
```

powershell

``` pwsh
Set-Location ./linux
./init.ps1
```
