# 执行各安装脚本
apt/set_apt.sh
oh-my-zsh/install_ohmyzsh.sh
python/install_python.sh # 如果已经安装过anaconda则不会进行任何修改
# nvidia-driver/install_nvidia.sh

# 切换到zsh
cowsay "All Installation Success!"
exec zsh -l
