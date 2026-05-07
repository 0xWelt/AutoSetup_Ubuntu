FILE=$(readlink -f "$(dirname "$0")")
if [ ! -d "$FILE/../tmp" ]; then
  mkdir "$FILE/../tmp"
fi

if command -v uv &> /dev/null; then
  echo "[python] uv 已安装，跳过"
else
  # 安装 uv
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi
