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
