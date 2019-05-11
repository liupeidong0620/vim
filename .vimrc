"
" lipeidong 私人定制vim配置
" vim 配置针对 c/c++ python3 golang lua
" 关闭兼容模式
set nocompatible " be iMproved ,required 去除vi一致性
"保存全局变量
set viminfo+=!
"设置文件格式为unix，这样换行不会带 ^M
set fileformat=unix

"=====================vim-plug 进行插件管理 =========================
"
" Vundle 来管理插件多年不更新，这里使用新的插件管理模块

" ~/.vim/plugged 指定插件下载的目录
"安装插件{
call plug#begin('~/.vim/plugged')

" 主题
Plug 'altercation/vim-colors-solarized' "皮肤
"Molokai 主题
Plug 'tomasr/molokai'

" 针对c/c++ 自动生成索引，跳转代码
" 插件基于ctags 目前使用最新的universal-ctags/ctags
Plug 'ludovicchabant/vim-gutentags'
" 打理gtags生成的标签
Plug 'skywind3000/gutentags_plus'
"
" 代码补齐插件
" 这个插件需要编译
"Plug 'ycm-core/YouCompleteMe'
"YouCompleteMe 辅助插件，生成项目 .ycm_extra_conf.py 文件
"Plug 'rdnetto/YCM-Generator'

" 目录列表
" 在第一次执行 NERDTreeToggle 命令时，NERD tree 插件才开始加载
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"nerdtree 辅助插件，展示文件状态
Plug 'Xuyuanp/nerdtree-git-plugin'

"CurtineIncSw.vim 插件，用于头文件源文件来回切换
Plug 'ericcurtin/CurtineIncSw.vim'
"类/方法/变量相关侧边栏，依赖 ctags
Plug 'majutsushi/tagbar'
"自动补全括号插件
Plug 'jiangmiao/auto-pairs'
"状态栏
Plug 'vim-airline/vim-airline'
" 状态栏主题显示
"Plug 'vim-airline/vim-airline-themes'
"开箱即用型的语法高亮包，支持大部分前端后台语言
Plug 'sheerun/vim-polyglot'
"配对标签跳转
Plug 'andymass/vim-matchup'
"异步实时代码检索
Plug 'wsdjeg/FlyGrep.vim'
"nerdtree 辅助插件，展示文件状态
Plug 'Xuyuanp/nerdtree-git-plugin'
"版本控制系统 vcs 展示每列的增删改状态，支持大部分 vcs
Plug 'mhinz/vim-signify'
"查看和切换缓冲区
Plug 'bsdelf/bufferhint'
" 语法检查
Plug 'w0rp/ale'
"  STL 容器模板类 unordered\_multimap 并未高亮
"  vim 对 C++ 语法高亮支持不够好（特别是 C++11/14 新增元素）
"  必须借由插件 vim-cpp-enhanced-highlight（https://github.com/octol/vim-cpp-enhanced-highlight ）进行增强
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" 常用命令
" :PlugInstall    - 安装插件
" :PlugUpdate     - 更新插件
" :PlugClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

"=====================end ===========================================


"==============================基础设置====================
"
"=========================================
" 键盘配置
"=========================================
"设置快捷键的前缀
let mapleader = "\<Space>"

" CTRL + N 打开下一个 tab
nnoremap <C-N> :tabn<CR>
" CTRL + P 打开上一个 tab
nnoremap <C-P> :tabp<CR>
" CTRL + LEFT 打开 buffer 文件列表下个文件
nnoremap <C-L> :bn<CR>
" CTRL + RIGHT 打开 buffer 文件列表上个文件
nnoremap <C-R> :bp<CR>

"可视模式 Ctrl + C 选择复制到系统剪贴板
vnoremap <silent> <C-C> "+y<CR>:wviminfo! ~/.viminfo<CR>
"可视模式 CTRL + X 剪切到系统剪贴板
vnoremap <silent> <C-X> "+x<CR>:wviminfo! ~/.viminfo<CR>
"插入模式 CTRL + V 粘贴到系统剪贴板
inoremap <silent> <C-V> :rviminfo! ~/.viminfo<CR>"+p<CR>
"命令模式 CTRL + V 粘贴到系统剪贴板
cnoremap <C-V> <C-R>+<CR>

"=========================================
" 语言配置
"=========================================
"编码
" 编码格式设置，不太懂，，，
" 使用 utf-8 no-bom编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" 开启文件类型检查，这将触发FileType事件，该事件可用于设置语法突出显示，设置选项等
filetype on
" 开启文件类型插件，会在'runtimepath'中加载文件“ftplugin.vim”
filetype plugin on
" 开启文件类型缩进，会在'runtimepath'中加载文件“indent.vim”
filetype indent on
"将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set expandtab

set sw=4        " 将一个tab显示为4个空格  shiftwidth
"编辑时一个TAB字符占多少个空格的位置 tabstop
set ts=4        " 每一级缩进的长度
set nu          " 显示行号
set softtabstop=4	"一次删除四个空格
" 使回格键（backspace）正常处理indent(缩进位置), eol(行结束符), start(段首), 很奇怪 Vim 默认竟然不允许在这些地方使用 backspace
set backspace=indent,eol,start

"开启时，在行首按TAB将加入 shiftwidth 个空格，否则加入 tabstop 个空格
set smarttab
"设置光标超过 130 列的时候折行
set tw=130
"不在单词中间断行，如果一行文字非常长，无法在一行内显示完的话，它会在单词与单词间的空白处断开
"尽量不会把一个单词分成两截放在两个不同的行里
set lbr
"打开断行模块对亚洲语言支持
"m 表示允许在两个汉字之间断行，即使汉字之间没有出现空格
"B 表示将两行合并为一行的时候，汉字与汉字之间不要补空格
set fo+=mB
"显示括号配对情况。打开这个选项后，当输入后括号(包括小括号、中括号、大括号) 的时候，光标会跳回前括号片刻，然后跳回来，以此显示括号的配对情况
"带有如下符号的单词不要被换行分割
set iskeyword+=$,@,%,#,-,_
set sm
"缩进方式，每一行都和前一行有相同的缩进量，当遇到右花括号（}）等，则取消缩进形式
"set smartindent
"缩进方式，用C语言的缩进格式来处理程序的缩进结构
set cindent
"设置当文件被改动时自动载入
set autoread
"当你编辑下一个文件的时候，目前正在编辑的文件如果改动，将会自动保存
set autowrite
"输出时只有文件名，不带./ ../等目录前缀(默认了执行％在当前的目录下)
set autochdir
"禁止生成临时文件
set noundofile
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase
augroup file_type
    autocmd!
    "为特定后缀的文件设置文件类型
    autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
    autocmd BufRead,BufNewFile *.{go}   set filetype=go
    autocmd BufRead,BufNewFile *.{js}   set filetype=javascript
    autocmd BufRead,BufNewFile *.{htm}   set filetype=html
augroup END

"=========================================
" 鼠标设置
"=========================================

set mouse=a     " 开启鼠标控制
" cp 关闭鼠标控制，进行对vim中复制内容
nmap <silent> cp :set mouse=<CR>
" cm 启动鼠标控制，直接使用鼠标浏览文件
nmap <silent> cm :set mouse=a<CR>

"=========================================
" 显示配置
"=========================================
"设置主题vim
"colorscheme desert
"let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" 开启语法高亮功能
syntax enable
"打开 vim 语法高亮
syntax on
"在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来
set wildmenu
"指定在选择文本时，光标所在位置也属于被选中的范围。如果指定 selection=exclusive 的话，可能会出现某些文本无法被选中的情况
set selection=inclusive
"选择字符，使用鼠标时或 shift+特殊键时进入选择模式
set selectmode=mouse,key
"当右键单击窗口的时候，弹出快捷菜单, GUI
set mousemodel=popup
"指定在选择文本时，光标所在位置也属于被选中的范围。如果指定 selection=exclusive 的话，可能会出现某些文本无法被选中的情况
set selection=inclusive
"选择字符，使用鼠标时或 shift+特殊键时进入选择模式
set selectmode=mouse,key
"当右键单击窗口的时候，弹出快捷菜单, GUI
set mousemodel=popup
"256位色
set t_Co=256
"设置查找字符串高亮,高亮显示搜索结果
set hlsearch
"高亮光标所在行
set cul
"高亮光标所在列
set cuc
"历史记录数
set history=1000
"高亮显示匹配的括号
set showmatch
"显示状态栏
set laststatus=2
"突出显示当前行
set cursorline
"设置魔术
set magic
"打开搜索高亮模式，若搜索找到匹配项就高亮显示所有匹配项
set hlsearch
" 开启实时搜索功能
set incsearch

"设置当文件被改动时自动载入
set autoread

"menu:匹配多于一个使用弹框显示补全，longest:不懂
set completeopt=longest,menu
"在处理未保存或只读文件的时候，弹出确认
set confirm
"使用 :commands 命令模式时总是报告修改的行数
set report=0

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
augroup vimrcEx
    "当打开一个文件，跳到上次光标所在位置
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
    " quickfix 模式
    autocmd FileType c,cpp noremap <buffer> <leader><space> :w<cr>:make<cr>
augroup END


"set cscope  函数查询
"set cscopequickfix=s-,c-,d-,i-,t-,e-

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
"set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)

" 创建新文件 .c .h .sh .java .py 自动 干一些事情
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.go, exec ":call SetTitle()"


"==============================基础设置====================

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

"let $GTAGSLABEL = 'native-pygments'
let $GTAGSLABEL = 'native'
let $GTAGSCONF = '/etc/gtags.conf'

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

"*******************YouCompleteMe*********************
" YouCompleteMe 代码补齐插件 
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

"noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ }

"=========================================
" NERDTree 插件配置
"=========================================
"打开树形目录
noremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <ESC> :NERDTreeToggle<CR>
noremap <F4> :NERDTreeFind<CR>
inoremap <F4> <ESC> :NERDTreeFind<CR>
let NERDTreeWinSize=20
augroup vimrcEx-NERDTree
    "只剩 NERDTree 时自动关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END


"=========================================
" vim omnicompletion 配置
"=========================================
"OmniCppComplete 是根据 Ctags 生成的索引文件进行补全
"开启各种语言的补全
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
autocmd FileType python set omnifunc=python3complete#Complete
autocmd FileType JavaScript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"############################################### end common-conf ###############################
"
"############################################### begin 所有插件配置 #############################
"=========================================
" CurtineIncSw.vim 插件配置
"=========================================
"CTRL + S 头文件源文件来回切换
noremap <C-W> :call CurtineIncSw()<CR>

"=========================================
" tagbar 插件配置，依赖 ctags
"=========================================
" F9 展示类/方法/变量相关侧边栏
nnoremap <F9> :TagbarToggle<CR>
"启动时自动focus
let g:tagbar_autofocus = 1
let g:tagbar_width=20

"=========================================
" vim-airline 插件配置
"=========================================
"当只打开一个选项卡时自动显示所有缓冲区
let g:airline#extensions#tabline#enabled = 1
" vim-airline选择主题
"let g:airline_theme='simple'

"=========================================
" indentLine 插件配置
"=========================================
"打开缩进线
let g:indentLine_enabled = 1
let g:indentLine_char='¦'

" 打开缩进线 IndentLinesToggle


"=========================================
" SimpylFold 插件配置
"=========================================
"在折叠文本中预览 python docstring
"let g:SimpylFold_docstring_preview = 1

"=========================================
" FlyGrep 插件配置
"=========================================
nnoremap <C-F> :FlyGrep<CR>

"Ctrl-F，在当前目录下搜索关键词，这里我一般是在项目根目录下搜索，所以先移动收到根目录
"<Esc>，退出搜索
"<Enter>，进入选中的搜索结果
"<Tab>，下一个搜索结果
"<S-Tab>，上一个搜索结果
"<Home>，第一个开始结果
"<End>，最后一个搜索结果

"=========================================
" nerdtree-git-plugin 插件配置
"=========================================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"=========================================
" ale 插件配置
"=========================================
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
" only the linters from g:ale_linters and b:ale_linters will be enable
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \   'cpp': ['cppcheck'],
            \   'c': ['cppcheck'],
            \   'python': ['pylint'],
            \}
" normal 模式下文字改变运行 linter
let g:ale_lint_on_text_changed = 'normal'
" 离开 insert 模式的时候运行 linter
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++0x'
let g:ale_c_cppcheck_options = '--enable=all'
let g:ale_cpp_cppcheck_options = '--enable=all'


"=========================================
" vim-signify 插件配置
"=========================================
" 设置要检查的VCS
"let g:signify_vcs_list = ['git', 'svn']
" 插入模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
"let g:signify_cursorhold_insert     = 1
" 正常模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
"let g:signify_cursorhold_normal     = 1
" 缓冲区被修改时更新符号
"let g:signify_update_on_bufenter    = 0
" vim获取焦点时更新符号
"let g:signify_update_on_focusgained = 1
"仅为当前缓冲区打开插件
"nnoremap <leader>gt :SignifyToggle<CR>
" 键盘映射
"nnoremap <leader>gt :SignifyToggle<CR>
"nnoremap <leader>gh :SignifyToggleHighlight<CR>
"nnoremap <leader>gr :SignifyRefresh<CR>
"nnoremap <leader>gd :SignifyDebug<CR>
" hunk jumping
"nnoremap <leader>gj <plug>(signify-next-hunk)
"nnoremap <leader>gk <plug>(signify-prev-hunk)
" hunk text object
"onoremap ic <plug>(signify-motion-inner-pending)
"xnoremap ic <plug>(signify-motion-inner-visual)
"onoremap ac <plug>(signify-motion-outer-pending)
"xnoremap ac <plug>(signify-motion-outer-visual)

"=========================================
" vim-cpp-enhanced-highlight  插件配置
"=========================================



"===========================end===============================
