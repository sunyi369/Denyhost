#!/bin/bash
# 读取系统的发行版信息
OS=$(cat /etc/os-release)
# 判断是否包含centos8的关键字
if [[ $OS == *"centos"* ]] && [[ $OS == *"8"* ]]; then
    # 如果是centos8，输出相应的信息
    echo "This system is centos8."
    cd /etc/yum.repos.d/
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
    yum install python27
    cp /usr/bin/python2.7 /usr/bin/python
else
    # 如果不是centos8，输出相应的信息
    echo "This system is not centos8."
fi
yum install python27
cp /usr/bin/python2.7 /usr/bin/python
wget https://github.com/denyhosts/denyhosts/archive/refs/tags/v2.10.tar.gz
tar xzvf v2.10.tar.gz
mv denyhosts-2.10/ /usr/share/denyhosts
cd /usr/share/denyhosts/
rm -f denyhosts.conf
wget https://raw.githubusercontent.com/sunyi369/Denyhost/master/denyhosts.cfg /usr/share/denyhosts
cp denyhosts.cfg /etc/denyhosts.conf
cp denyhosts.py /usr/sbin/denyhosts
mv daemon-control-dist daemon-control
cd /etc/init.d
ln -s /usr/share/denyhosts/daemon-control denyhosts
touch /var/log/auth.log
chkconfig denyhosts on 
cp /usr/share/denyhosts/daemon-control /usr/sbin/dh
dh restart

