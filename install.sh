# 安装些基本工具
sudo apt install -y --upgrade wget cowsay

# 建立所需文件结构
if [ ! -d "tmp" ]; then
    mkdir "tmp"
fi

# 执行各安装脚本
oh-my-zsh/ohmyzsh_install.sh

python/anaconda_install.sh      # 如果已经安装过anaconda则不会进行任何修改
~/anaconda3/bin/conda init zsh  # 即使已经装过，也再进行一次init



# 切换到zsh
cowsay "All Installation Success!"
exec zsh -l
