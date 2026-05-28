#!/bin/bash
set -e

FILE=$(readlink -f "$(dirname "$0")")
if [ ! -d "$FILE/../tmp" ]; then
  mkdir "$FILE/../tmp"
fi

# 更新系统内的包，并安装所需的基础包
sudo apt update
sudo apt install -y --upgrade language-pack-en zsh tmux git vim htop trash-cli wget cowsay net-tools git-lfs aria2 tzdata

# 设置系统时区为东八区（Asia/Shanghai）
if command -v timedatectl &> /dev/null; then
  sudo timedatectl set-timezone Asia/Shanghai
else
  sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  echo "Asia/Shanghai" | sudo tee /etc/timezone > /dev/null
fi
