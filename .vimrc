"""""""""""""""""""""
"vundle.vim
"可以管理 安装 卸载 vim的插件
"""""""""""""""""""""

set nocompatible " be iMproved ,required 去除vi一致性
filetype off  " required  从这里开始vundle管理开始
"设置运行跟初始化Vundle的路径
set rtp+=~/.vim/bundle/vundle/

"设置插件的安装目录，默认是vundle
"call vundle#begin('~/.vim/')
"所有的安装插件都要在begin 跟 end
call vundle#begin()
"安装插件{

Bundle 'winmanager'
Plugin 'altercation/vim-colors-solarized' "皮肤
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'

"python 插件
"折叠
Plugin 'tmhedberg/SimpylFold'
"自动缩进
Plugin 'vim-scripts/indentpython.vim'
"语法高亮
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
"这段空间处}
"
"GO 语言插件
Plugin 'fatih/vim-go'
call vundle#end() " required
filetype plugin on "required
" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可
" h: vundle         - 获取帮助
" vundle的配置到此结束，下面是你自己的配置


"taglist set  主要在作出显示小窗口，工程目录和当前打开的文件的函数和变量
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:NERDTree_title="[NERDTree]"  
"netrw.vim set  设置快捷键
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='NERDTree|TagList'

" NERDTree 文件浏览
let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()  
	exec 'NERDTree'  
endfunction  

function! NERDTree_IsValid()  
	return 1  
endfunction

nmap <silent> wm :WMToggle<cr>
"tagbar 设置使用
"快捷键设置
nmap <silent> tb :TagbarToggle<CR>      
"let g:tagbar_ctags_bin='ctags'            "ctags程序的路径
let g:tagbar_width=20                    "窗口宽度的设置
"map <F3> :Tagbar<CR>
""autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"如果是c语言的程序的话，tagbar自动开启

synta enable    " 语法高亮使能
syntax on       " 语法高亮
set ai
set si
set sw=4        " 将一个tab显示为4个空格
set ts=4        " 每一级缩进的长度
set mouse=a     " 开启鼠标控制
set nu          " 显示行号
set softtabstop=4	"一次删除四个空格

set clipboard=unnamed,unnamedplus "可以从vim复制到剪切板中
" 自动补齐大括号
"imap { {<CR>}<Esc>kA<CR>
"set nobomb      " utf-8 without bom
"set expandtab   " tab设置为空格
"set cindent     " 针对c语言的字段缩进

" 编码格式设置，不太懂，，，
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"设置主题vim
"colorscheme desert
"let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"设置查找字符串高亮
set hlsearch


"set cscope  函数查询
set cscopequickfix=s-,c-,d-,i-,t-,e-

"开启文件检测
filetype on
filetype plugin on
filetype indent on

" 代码折叠
" Enable folding
"set foldmethod=indent
"set foldlevel=99
"nnoremap <space> za

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)
" 创建新文件 .c .h .sh .java .py 自动 干一些事情
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.go, exec ":call SetTitle()"

func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Liupd") 
        call append(line(".")+2, "\# mail: liupeidong0620@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    endif
	if &filetype == 'python'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Liupd") 
        call append(line(".")+2, "\# mail: liupeidong0620@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/usr/bin/python") 
        call append(line(".")+6, "") 
    endif
	endif

    autocmd BuffNewFile * normal G
endfunc
