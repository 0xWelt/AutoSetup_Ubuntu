#!/bin/bash
set -e

FILE=$(readlink -f "$(dirname "$0")")
if [ ! -d "$FILE/../tmp" ]; then
  mkdir "$FILE/../tmp"
fi

# 安装/更新 uv
curl -LsSf https://astral.sh/uv/install.sh | sh
