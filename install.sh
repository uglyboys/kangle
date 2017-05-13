#!/bin/bash
echo "配置基础环境中……"
echo "timeout=120" >> /etc/yum.conf
yum -y update
yum -y install epel-release
ulimit -n 1048576
echo "* soft nofile 1048576" >> /etc/security/limits.conf
echo "* hard nofile 1048576" >> /etc/security/limits.conf
echo "Kangle准备安装中……"
wget https://raw.githubusercontent.com/uglyboys/kangle/master/kangle/kangle.sh  -O kangle.sh;sh kangle.sh /vhs/kangle
echo "数据库准备安装中……"
yum install mariadb-server mariadb
systemctl start mariadb.service
systemctl enable mariadb.service
echo "设置数据库密码,请回车,并一路y下去……"
/usr/bin/mysql_secure_installation
ln -s /usr/bin/mysql /vhs/kangle/bin/mysql
ln -s /usr/bin/mysqldump /vhs/kangle/bin/mysqldump
yum install php php-cli php-mysql php-gd php-xml php-pdo php-mbsring
