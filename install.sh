# 安装些基本工具
sudo apt install -y --upgrade wget cowsay

# 建立所需文件结构
if [ ! -d "tmp" ]; then
    mkdir "tmp"
fi

# 执行各安装脚本
sudo oh-my-zsh/ohmyzsh_install.sh
python/anaconda_install.sh

# 切换到zsh
cowsay "All Installation Success!"
exec zsh -l
