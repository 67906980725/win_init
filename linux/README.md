# README

press key win+x, choose: terminal(administrator) 按快捷键win+x, 选择:终端（管理员）

winget install 9MZ1SNWT0N5D # install powershell

pwsh

``` pwsh
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

git clone --depth 1 git@github.com:67906980725/win_init.git
cd win_init\
.\init.ps1
```

参考 [jayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows)

[ubuntu 初始化](./ubuntu_init/README.md)