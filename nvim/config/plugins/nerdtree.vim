"=========================================
" NERDTree 插件配置
"=========================================
"打开树形目录
noremap <F3> :NERDTreeToggle<CR>
inoremap <F3> <ESC> :NERDTreeToggle<CR>
"noremap <F4> :NERDTreeFind<CR>
"inoremap <F4> <ESC> :NERDTreeFind<CR>
let NERDTreeWinSize=20
augroup vimrcEx-NERDTree
    "只剩 NERDTree 时自动关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
