#!/usr/bin/env bash

. ./util.sh

git_hub_src() {
  wget -O tmp.zip "${github_px}https://github.com/$1/$2/archive/refs/heads/master.zip"
  unzip tmp.zip
  rm tmp.zip
  mv $2-master $HOME/$3
}

git_hub_src ohmyzsh ohmyzsh .oh-my-zsh
git_hub_src romkatv powerlevel10k .oh-my-zsh/custom/themes/powerlevel10k
git_hub_src Aloxaf fzf-tab .oh-my-zsh/custom/plugins/fzf-tab
git_hub_src zsh-users zsh-autosuggestions .oh-my-zsh/custom/plugins/zsh-autosuggestions
git_hub_src zsh-users zsh-completions .oh-my-zsh/custom/plugins/zsh-completions
git_hub_src zsh-users zsh-syntax-highlighting .oh-my-zsh/custom/plugins/zsh-syntax-highlighting

cp -f ../conf/.p10k.zsh $HOME/
cp -f ../conf/.zshrc $HOME/