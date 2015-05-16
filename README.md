# check_websit_state
使用常驻进程去轮训，判断服务器的响应速度，或者返回状态。

#使用方法

执行
        bundle install
        god
        god load keepalive.god
        god start singleton
    
配置好smtp中的各个参数，常驻进程会在每分钟内进行访问网站，查看网站是否正常。

