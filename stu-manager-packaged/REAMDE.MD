打包步骤
环境要求: jdk1.7 + 
         mysql


1. 先进入stu-manager 进行模块编译, 执行 mvn clean package install

2. 进入stu-manger-package 进行打包, 执行 mvn clean package assembly:assembly 

3. 目录stu-manager-packaged/target/stu-manager-full.tar.gz 即是生成的最终程序;
   a)复制stu-manager-full.tar.gz 到/opt下并解压
   b)dbscript下的数据库脚本导入到数据库
   c)conf下的application.properties根据实际情况修改数据库连接信息
   d)在bin下执行stu-manager start 即启动;