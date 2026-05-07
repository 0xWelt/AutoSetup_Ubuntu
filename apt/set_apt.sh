#!/bin/bash
set -e

FILE=$(readlink -f "$(dirname "$0")")
if [ ! -d "$FILE/../tmp" ]; then
  mkdir "$FILE/../tmp"
fi

# 更新系统内的包，并安装所需的基础包
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install -y --upgrade language-pack-en zsh tmux git vim htop trash-cli wget cowsay net-tools git-lfs aria2
