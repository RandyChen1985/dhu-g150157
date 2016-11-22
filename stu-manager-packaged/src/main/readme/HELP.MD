###环境准备###
0.readme-base

1.安装bekerley环境
    a.解压/opt/xcloud-all/data/db-5.3.21.tar.gz.tar至/opt下
    b.编译
        1)cd /opt/db-5.3.21/build_unix
        2)../dist/configure --enable-java
        3)make
        4)make install
    c.将/usr/local/BerkeleyDB.5.3/lib下的libdb-5.3.so以及libdb_java*.so复制到{java_home}/jre/lib/amd64下
        1)cp -f /usr/local/BerkeleyDB.5.3/lib/libdb-5.3.so /opt/jdk/jre/lib/amd64/
        2)cp -f /usr/local/BerkeleyDB.5.3/lib/libdb_java*.so /opt/jdk/jre/lib/amd64/
        
2.启动mysql，redis，mq

3.初始化mq
    a.登录http://{mqserverip}:55672
    b.创建vhost:xnode-hub
    c.创建用户：xnode
    d.设置用户xnode拥有xnode-hub所有的权限
    e.更改/opt/xcloud-all/conf/xnode.properties文件中的相关配置，如xnode.hub.mq.host等等



