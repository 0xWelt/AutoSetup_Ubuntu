FILE=$(readlink -f "$(dirname "$0")")
if [ ! -d "$FILE/../tmp" ]; then
  mkdir "$FILE/../tmp"
fi

# 下载安装anaconda
wget -c -P $FILE/../tmp/ https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh
sh $FILE/../tmp/Anaconda3-2024.06-1-Linux-x86_64.sh -b

# 进行anaconda初始化
user=$(whoami)
shell=$(grep $user /etc/passwd)
shell=${shell##*/}
~/anaconda3/bin/conda init $shell # 即使已经装过，也再进行一次init

# # 换南大源
# if [ ! -d "~/.condarc.old" ]; then
#   if [ -d "~/.condarc" ]; then
#     cp ~/.condarc ~/.condarc.old
#   fi
# fi
# cat >~/.condarc <<EOF
# channels:
#   - defaults
# show_channel_urls: true
# default_channels:
#   - https://mirror.nju.edu.cn/anaconda/pkgs/main
#   - https://mirror.nju.edu.cn/anaconda/pkgs/r
#   - https://mirror.nju.edu.cn/anaconda/pkgs/msys2
# custom_channels:
#   conda-forge: https://mirror.nju.edu.cn/anaconda/cloud
#   msys2: https://mirror.nju.edu.cn/anaconda/cloud
#   bioconda: https://mirror.nju.edu.cn/anaconda/cloud
#   menpo: https://mirror.nju.edu.cn/anaconda/cloud
#   pytorch: https://mirror.nju.edu.cn/anaconda/cloud
#   simpleitk: https://mirror.nju.edu.cn/anaconda/cloud
# EOF

# # 更改pip为南大源
# if [ ! -d "~/.config/pip/pip.conf" ]; then
#   mkdir -vp ~/.config/pip
# fi
# cat >~/.config/pip/pip.conf <<EOF
# [global]
# index-url = https://mirror.nju.edu.cn/pypi/web/simple
# EOF
