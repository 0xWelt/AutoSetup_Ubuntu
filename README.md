# AutoSetup_Ubuntu
> Auto setup basic develop enviconment and utilities on ubuntu>=12.04



### 项目概况

当你手头有了5台以上服务器的时候，你就不得不考虑自动化配置某些环境了。本项目的创作背景就是作者于某互联网公司实习期间，手头一下子有了自己的、学校的、公司的好多台服务器，被环境配置和各种突发问题搞得头要炸了，总算下定决心要把这事妥善解决。

本项目的主旨即实现一个**“能在任何Linux系统上完全自动配置好基础设施”**的自动化shell脚本。



### 功能特性

- 硬 / 软件要求：**有网 / Ubuntu>=12.04**（更多系统支持正在路上）

- 自动配置内容

  - **apt**：切换为对应Ubuntu发行版的”[清华源](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/)“，自动更新现有包，并安装基础工具。
  - **oh-my-zsh**：自动安装zsh、[oh-my-zsh](https://ohmyz.sh/)及常用插件、[powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)主题，并修改配置文件。全部走gitee资源下载，减少github网络不畅导致的下载安装问题。
  - **python**：在用户目录下安装anaconda，并切换[anaconda](https://mirror.tuna.tsinghua.edu.cn/help/anaconda/)与[pip](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)为对应的清华源。

  - 其他
    - 安装可爱的`cowsay`工具作为提示信息输出
    - 安装`sl`命令，缓解`ls`命令输反之后的尴尬
    - 安装`cmatrix`命令，命令行也能黑客帝国



### 使用方式

- 克隆本项目到本地

  ```shell
  git clone https://github.com/Nickydusk/AutoSetup_Ubuntu.git
  cd AutoSetup_Ubuntu
  ```

- 一键配置所有环境（适合新机器）

  ```shell
  ./install.sh
  ```

- 仅需要配置部分环境: 根据需要cd到相应目录，并执行对应的安装脚本。
