

# 设置数据库密码、端口
mysql_port=33116
mysql_password=123456
# q1w2e3r4
# $`pwd`能输出当前位置
cur_path=`pwd`



docker rm mysql

# docker pull mysql:5.7
# docker pull mysql:5.5
# docker pull mysql:8.0.32
docker run -p ${mysql_port}:3306 \
    --privileged=true \
    --name mysql \
    -v $cur_path/logs:/logs \
    -v $cur_path/data:/var/lib/mysql \
    -v $cur_path/conf.d/my.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf \
    -v $cur_path/run/:/var/run/mysql \
    -e MYSQL_ROOT_PASSWORD=${mysql_password} \
    -d mysql:8.0.32
