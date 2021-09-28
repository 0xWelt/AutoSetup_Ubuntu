FILE=$(readlink -f "$(dirname "$0")")
if [ ! -d "$FILE/../tmp" ]; then
    mkdir "$FILE/../tmp"
fi

# 备份老apt源
if [ ! -d "/etc/apt/sources.list.old" ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.old
fi

# 按照Ubuntu发行版，换对应的清华源
distribution=$(cat /etc/os-release | grep -o "UBUNTU_CODENAME=.*")
distribution=${distribution##*UBUNTU_CODENAME=}
cat > $FILE/../tmp/sources.list << EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution} main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution} main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${distribution}-proposed main restricted universe multiverse
EOF
sudo cp $FILE/../tmp/sources.list /etc/apt/sources.list

# 更新系统内的包，并安装所需的基础包
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install -y --upgrade git screen wget cowsay cmatrix sl