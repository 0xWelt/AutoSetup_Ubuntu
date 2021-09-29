sudo apt install -y --upgrade python-software-properties software-properties-common ubuntu-drivers-common
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update

if ubuntu-drivers devices | grep "NVIDIA Corporatio"; then
    if ! command -v nvidia-smi >/dev/null 2>&1 || nvidia-smi | grep -i "failed"; then
        # 卸载所有可能的nvidia残留
        sudo /usr/bin/nvidia-uninstall
        sudo apt-get purge "*cublas*" "cuda*"
        sudo apt-get purge -y "*nvidia*"
        sudo apt autoremove -y

        # 安装最新驱动
        sudo ubuntu-drivers autoinstall

        # 禁用内核，并用新的驱动启动
        sudo rmmod nvidia
        nvidia-smi
    fi
else
    echo "No Nvidia Device, Skip!"
fi
