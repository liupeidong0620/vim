set nu          " 显示行号
set expandtab   " tab设置为空格
set nobomb      " utf-8 without bom
set cindent     " 针对c语言的字段缩进

"c代码折叠方案

" ctats插件使用    set tag=路径/tags(ctags -R 生成的文件，生成之前要安装ctags)
" 支持函数跳转 ctrl+] 查看定义  ctrl+o 返回  g+d 快速到局部变量  g+f去头文件
"set tag=/usr/include/tags  " c 中头文件
"cs add /home/liu/桌面/netpas/Netfits-Router/main/cscope.out /home/liu/桌面/netpas/Netfits-Router/main/

"set tag=/home/liu/netpas_source/main/tags
"cs add /home/liu/netpas_source/main/cscope.out /home/liu/netpas_source/main

"tcp_ip ctags 和 cscope设置

"set tag =/mnt/hgfs/share/tcp_ip/tags
"cs add /mnt/hgfs/share/tcp_ip/cscope.out /mnt/hgfs/share/tcp_ip/

"dig source查看
"set tag=/mnt/hgfs/share/bind-9.9.10-P3/tags
"cs add /mnt/hgfs/share/bind-9.9.10-P3/cscope.out /mnt/hgfs/share/bind-9.9.10-P3/

""FTP
""set tag=/home/liu/open_source/ftp/ftplib/tags
"cs add /home/liu/open_source/ftp/ftplib/cscope.out /home/liu/open_source/ftplib/FTP

"event epoll 
"set tag=/home/liu/open_source/zaver/tags
"cs add /home/liu/open_source/zaver/cscope.out /home/liu/open_source/zaver/

"nginx suource code study
"set tag=/home/liu/open_source/nginx/liu_test_nginx/nginx-1.4.2/tags
"cs add /home/liu/open_source/nginx/liu_test_nginx/nginx-1.4.2/cscope.out /home/liu/open_source/nginx/liu_test_nginx/nginx-1.4.2/

"netpas_clientd suource code
"set tag=/home/liu/netpas_clientd/tags
"cs add /home/liu/netpas_clientd/cscope.out /home/liu/netpas_clientd/

"netpas_client source code 
"set tag=/home/liu/linux_node_tools/netpas_client/tags
"cs add /home/liu/linux_node_tools/netpas_client/cscope.out /home/liu/linux_node_tools/netpas_client

"netlink study
"set tag=/home/liu/open_source/route_netlink/tags
"cs add /home/liu/open_source/route_netlink/cscope.out /home/liu/open_source/route_netlink
"ip_route source code
"set tag=/home/liu/open_source/iproute2/tags
"cs add /home/liu/open_source/iproute2/cscope.out /home/liu/open_source/iproute2
"set tag=/mnt/hgfs/share/iproute2-3.1.0/tags
"cs add /mnt/hgfs/share/iproute2-3.1.0/cscope.out /mnt/hgfs/share/iproute2-3.1.0

"p2p suorce 
"set tag=/home/liu/open_source/p2p/p2p/tags
"cs add /home/liu/open_source/p2p/p2p/cscope.out /home/liu/open_source/p2p/p2p
"
"kernel 内核源码中的 红黑树学习
"set tag=/mnt/hgfs/share/rb_tree/linux_rbtree/tags
"cs add /mnt/hgfs/share/rb_tree/linux_rbtree/cscope.out /mnt/hgfs/share/rb_tree/linux_rbtree
"netpas red-server   ----> netpas_udp_server
"set tag=/home/liu/netpas_red_sever/red-server/netpas_udp_server/tags
"cs add /home/liu/netpas_red_sever/red-server/netpas_udp_server/cscope.out /home/liu/netpas_red_sever/red-server/netpas_udp_server
"netpas red-server   ----> netpas_relayd
"set tag=/home/liu/netpas_red_sever/red-server/netpas_relayd/tags
"cs add /home/liu/netpas_red_sever/red-server/netpas_relayd/cscope.out /home/liu/netpas_red_sever/red-server/netpas_relayd/

" dig 源码分析
"set tag=/home/liu/open_source/bind_test/bind-9.11.2/tags
"cs add /home/liu/open_source/bind_test/bind-9.11.2/cscope.out /home/liu/open_source/bind_test/bind-9.11.2
"
"
"set tag=/Users/liu/Desktop/share/nat_log/code_server/tags
"ca add /Users/liu/Desktop/share/nat_log/code_server/cscope.out /Users/liu/Desktop/share/nat_log/code_server
"
"set tag=/home/bind-9.11.2/tags
"cs add /home/bind-9.11.2/cscope.out /home/bind-9.11.2

"set tag=/home/unbound-1.7.1/tags
"cs add /home/unbound-1.7.1/cscope.out /home/unbound-1.7.1

"set tag=/home/unbound_test/unbound-1.7.1/tags
"cs add /home/unbound_test/unbound-1.7.1/cscope.out /home/unbound_test/unbound-1.7.1


"set tag=/home/unbound_1/unbound-1.7.1/tags
"cs add /home/unbound_1/unbound-1.7.1/cscope.out /home/unbound_1/unbound-1.7.1
"set tag=/home/unbound_1/unbound_2/unbound-1.7.1/tags
"cs add /home/unbound_1/unbound_2/unbound-1.7.1/cscope.out /home/unbound_1/unbound_2/unbound-1.7.1

set tag=/home/curl_code/curl/tags
cs add /home/curl_code/curl/cscope.out /home/curl_code/curl
