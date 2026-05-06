# 执行各安装脚本
bash apt/set_apt.sh
bash git/git_setting.sh
bash oh-my-zsh/install_ohmyzsh.sh
bash tmux/install_tmux.sh
bash python/install_python.sh # 安装 uv
bash node/install_node.sh # 安装 Node.js (fnm + Node 24 + PM2)
# nvidia-driver/install_nvidia.sh

cowsay "All Installation Success!" 2>/dev/null || echo "All Installation Success!"
