set nu          " 显示行号
set expandtab   " tab设置为空格
set nobomb      " utf-8 without bom
set cindent     " 针对c语言的字段缩进

" ctats插件使用    set tag=路径/tags(ctags -R 生成的文件，生成之前要安装ctags)
" 支持函数跳转 ctrl+] 查看定义  ctrl+o 返回  g+d 快速到局部变量  g+f去头文件
"set tag=/usr/include/tags  " c 中头文件

" muduo 库使用
set tag=/home/liu/open_source/muduo/muduo/tags
cs add /home/liu/open_source/muduo/muduo/cscope.out /home/liu/open_source/muduo/muduo
