sudo apt install -y --upgrade python-software-properties build-essential gcc-multilib dkms software-properties-common ubuntu-drivers-common
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update

if ubuntu-drivers devices | grep "NVIDIA Corporatio"; then
  if ! command -v nvidia-smi >/dev/null 2>&1 || nvidia-smi | grep -i "failed"; then
    # 卸载所有可能的nvidia残留
    sudo /usr/bin/nvidia-uninstall
    sudo apt-get purge -y "*cublas*" "cuda*" "*nvidia*"
    sudo apt autoremove -y

<<<<<<< HEAD
        # 关闭所有当前依赖进程
        sudo rmmod nvidia_uvm
        sudo rmmod nvidia_drm
        sudo rmmod nvidia_modeset
        while sudo lsof -n -w /dev/nvidia* | grep "COMMAND" > /dev/null
        do
            proc=$(sudo lsof -n -w /dev/nvidia* | grep -v "COMMAND" | head -n 1)
            proc=${proc#*" "}
            proc=${proc%%" "*}
            sudo kill $proc
        done
        sudo rmmod nvidia

        # 重新装在nvidia驱动
        sudo ubuntu-drivers autoinstall   # TODO:不是最新，改成手动装470
        
        nvidia-smi
        echo "Nvidia-Driver Installed Successfully!"
    else
        nvidia-smi
        echo "Nvidia-Driver Already Installed!"
    fi
=======
    # 安装最新驱动
    sudo ubuntu-drivers autoinstall

    # 关闭所有当前依赖进程
    sudo rmmod nvidia_uvm
    sudo rmmod nvidia_modeset
    while sudo lsof -n -w /dev/nvidia* | grep "COMMAND" >/dev/null; do
      proc=$(sudo lsof -n -w /dev/nvidia* | grep -v "COMMAND" | head -n 1)
      proc=${proc#*" "}
      proc=${proc%%" "*}
      sudo kill $proc
    done
    sudo rmmod nvidia

    # 重新装在nvidia驱动
    nvidia-smi
    echo "Nvidia-Driver Installed Successfully!"
  else
    nvidia-smi
    echo "Nvidia-Driver Already Installed!"
  fi
>>>>>>> ab88c21e43236aee4f7b8f62818ebf604a6014b5
else
  echo "No Nvidia Device, Skip!"
fi
