" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "安装vim-plug
" "neovim
" "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.cache/plugins')

" "{{--------coc
Plug 'neoclide/coc.nvim', { 'do': './install.sh nightly' }
" "}}

" "{{--------git
Plug 'tpope/vim-fugitive'
Plug 'neoclide/vim-easygit'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
" "}}


" "{{--------markdown
Plug 'tpope/vim-markdown', {'for': ['markdown', 'md']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'md'] }
" "}}

" "{{--------golang
"GO 语言插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Blackrush/vim-gocode'
" "}}
"
"

" "{{--------code check
Plug 'w0rp/ale'
" "}}

" "{{----------tools
Plug 'majutsushi/tagbar',  { 'for': ['asm', 'h', 'hpp', 'c', 'cpp', 'python', 'js', 'ts', 'java', 'go', 'html', 'css', 'vim', 'sh', 'tex', 'md'] }

" 目录列表
" 在第一次执行 NERDTreeToggle 命令时，NERD tree 插件才开始加载
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"nerdtree 辅助插件，展示文件状态
Plug 'Xuyuanp/nerdtree-git-plugin'
" "}}


" "{{----------tools
" 针对c/c++ 自动生成索引，跳转代码
" 插件基于ctags 目前使用最新的universal-ctags/ctags
Plug 'ludovicchabant/vim-gutentags'
" 打理gtags生成的标签
Plug 'skywind3000/gutentags_plus'


"状态栏
Plug 'vim-airline/vim-airline'
"" 状态栏主题显示
Plug 'vim-airline/vim-airline-themes'
""开箱即用型的语法高亮包，支持大部分前端后台语言
Plug 'sheerun/vim-polyglot'


" 预览文件
Plug 'skywind3000/vim-preview'
"
" "}}
"
"
"
" "{{ ---- rust
"
Plug 'rust-lang/rust.vim'
" "}}
"

call plug#end()

"
" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可
"
