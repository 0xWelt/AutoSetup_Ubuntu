#!/bin/bash
set -e

# 安装/更新 fnm (Node.js 版本管理)
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# 加载 fnm 环境（使当前 shell 可用 fnm 命令）
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

# 安装/更新 Node.js 24 并设置默认
fnm install 24
fnm default 24

# 安装/更新 PM2 进程管理器
npm install pm2 -g
