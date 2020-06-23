"=====================每一个插件配置 =========================
"
"*******************vim-gutentags*********************
"vim-gutentags 配置自动生成ctags 索引
"项目改动完代码，也会自动生成
"插件是 基于universal-ctags/ctags
"各个系统安装到GitHub文档自行安装
"
" CTRL-] 直接在当前窗口里跳转到定义
" CTRL-o 返回上级定义
" CTRL-W ] 用新窗口打开并查看光标下符号的定义
" CTRL-W } 使用 preview 窗口预览光标下符号的定义
"
"

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" 如果目录是一个野目录，在目录里建立一个.root 空文件，会自动生成索引
" https://zhuanlan.zhihu.com/p/36279445  文档说明
"let $GTAGSLABEL = 'native-pygments'
"let $GTAGSLABEL = 'native'
" 第一个 GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块。
" 第二个环境变量必须设置，否则会找不到 native-pygments 和 language map 的定义， Windows 下面在 gtags/share/gtags/gtags.conf，Linux 下要到 /usr/local/share/gtags 里找，也可以把它拷贝成 ~/.globalrc ，Vim 配置的时候方便点。
"let $GTAGSCONF = '/etc/gtags.conf'

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启ctags 和 gtags支持
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

"let g:gutentags_trace = 1

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"*******************end*********************
"
"
"**************** 快捷键**********************


" gutentags_plus  使用
" :GscopeFind {querytype} {name}
"
"
" 0 or s: Find this symbol
" 1 or g: Find this definition
" 2 or d: Find functions called by this function
" 3 or c: Find functions calling this function
" 4 or t: Find this text string
" 6 or e: Find this egrep pattern
" 7 or f: Find this file
" 8 or i: Find files #including this file
" 9 or a: Find places where this symbol is assigned a value
" 
"
" 插件自定义了一些快捷键
"
" 快捷键关闭
" You can disable the default keymaps by:
"
" let g:gutentags_plus_nomap = 1
"
"
"<leader>cg - 查看光标下符号的定义
"<leader>cs - 查看光标下符号的引用
"<leader>cc - 查看有哪些函数调用了该函数
"<leader>cf - 查找光标下的文件
"<leader>ci - 查找哪些文件 include 了本文件
"
"
"
" <leader>cs	Find symbol (reference) under cursor
" <leader>cg	Find symbol definition under cursor
" <leader>cd	Functions called by this function
" <leader>cc	Functions calling this function
" <leader>ct	Find text string under cursor
" <leader>ce	Find egrep pattern under cursor
" <leader>cf	Find file name under cursor
" <leader>ci	Find files #including the file name under cursor
" <leader>ca	Find places where current symbol is assigned
" <leader>cz	Find current word in ctags database
