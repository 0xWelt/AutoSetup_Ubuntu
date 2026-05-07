#!/bin/bash
set -e

# 安装 fnm (Node.js 版本管理)
if command -v fnm &> /dev/null; then
  echo "[node] fnm 已安装，跳过"
else
  curl -o- https://fnm.vercel.app/install | bash
fi

# 加载 fnm 环境（使当前 shell 可用 fnm 命令）
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

# 安装 Node.js 24 并设置默认
if fnm list | grep -q "v24"; then
  echo "[node] Node.js 24 已安装，跳过"
else
  fnm install 24
  fnm default 24
fi

# 安装 PM2 进程管理器
if command -v pm2 &> /dev/null; then
  echo "[node] PM2 已安装，跳过"
else
  npm install pm2 -g
fi
