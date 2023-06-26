#!/usr/bin/env bash

# Linux 系统安装 Oh my posh 终端美化工具  https://www.cnblogs.com/oddpage/p/16135169.html

sudo wget ${github_px}https://github.com//JanDeDobbeleer/oh-my-posh/releases/download/v7.61.0/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget ${github_px}https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip