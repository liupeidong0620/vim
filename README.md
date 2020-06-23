# nvim 环境搭建

nvim 和 vim 使用方面没有任何不同

## 下载 & 安装

```sh
# linux 系统中 直接编译好的下载二进制
# 地址: https://github.com/neovim/neovim/releases

# 按照官方文档 安装即可，安装起来还是很简单的

# 我的安装步骤

mkdir ~/nvim && cd ~/nvim
wget 'https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage'
chmod u+x nvim.appimage

./nvim.appimage --appimage-extract
# 添加环境变量
export PATH=$PATH:/root/nvim/squashfs-root/usr/bin

# 查看版本信息
# nvim --version

```

## 配置文件目录

```sh
# vim 配置文件时~/.vimrc中

#nvim 配置文件目录 ~/.config/nvim/init.vim 文件中


# neovim的基础配置文件是~/.config/nvim/
.
├── autoload
│   └── plug.vim        # vim-plug插件
├── colors					# 用于存放主题的文件夹
├── config
│   ├── base.vim       # 基础配置
│   ├── keymap.vim  # 快捷键映射
│   ├── plugins           # 各种插件的配置文件夹
│   ├── plug.vim		# vim-plug的配置文件，用于描述需要哪些插件
│   └── theme.vim    # 主题配置
├── init.vim				# 初始配置

mkdir -p ~/.config/nvim
```

# vim-plug 插件管理

```sh

# 采用plug进行查看管理
# 安装vim-plug
#
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 接下来就是安装各种插件 详细内容看 plug.vim文件中

```

# 基础插件安装

## coc 安装

```sh
# 这个插件作用，主要是进行代码提示 
# vscode 提出的lsp 服务，很多vscode的插件，已经可以移植到vim中

# coc 安装需要nodejs yarn 进行编译

sudo curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -

sudo curl -sL install-node.now.sh | sh

node -v

# yarn 安装
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo

sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg

sudo yum install yarn

yarn --version

# python pip 安装

# yum install epel-release 
# yum install python-pip

# coc 依赖python
python -m pip install --user --upgrade pynvim

```

# 编程语言环境搭建

## golang 环境搭建

# vim-go 实现代码跳转

```sh
# vim-go插件安装
# 详情去查看 plug.vim 关于go的插件
# 插件配置 vim-go.vim

```

# 利用coc实现代码提示

```sh
# coc-settings.json 配置对应的代码提示lsp

```

## c/c++ 环境搭建

## 代码跳转ctags

```sh
# universal-ctags 
# github: https://github.com/universal-ctags/ctags

# 安装 目录
# https://snapcraft.io/install/universal-ctags/centos

# 安装完成以后,导入环境变量
# export PATH=$PATH:/var/lib/snapd/snap/bin/


# gtags 替代 cscope
 yumi install global-ctags


 # 会自动生成 gtag && ctags 进行跳转

```

## 代码补全

```sh
# lsp 插件进行代码补全

Todo
```


## rust 环境搭建

```sh

```