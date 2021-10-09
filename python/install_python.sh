FILE=$(readlink -f "$(dirname "$0")")
if [ ! -d "$FILE/../tmp" ]; then
  mkdir "$FILE/../tmp"
fi

# 下载安装anaconda
wget -c -P $FILE/../tmp/ https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2021.05-Linux-x86_64.sh
sh $FILE/../tmp/Anaconda3-2021.05-Linux-x86_64.sh -b -p

# 进行anaconda初始化
user=$(whoami)
shell=$(grep $user /etc/passwd)
shell=${shell##*/}
~/anaconda3/bin/conda init $shell # 即使已经装过，也再进行一次init

# 换清华源
if [ ! -d "~/.condarc.old" ]; then
  if [ -d "~/.condarc" ]; then
    cp ~/.condarc ~/.condarc.old
  fi
fi
cat >~/.condarc <<EOF
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
EOF
conda clean -i # 清空旧的缓存

# 更改pip为清华源
if [ ! -d "~/.config/pip/pip.conf" ]; then
  mkdir -vp ~/.config/pip
fi
cat >~/.config/pip/pip.conf <<EOF
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
EOF
