#!/bin/sh
wget https://nchc.dl.sourceforge.net/project/denyhosts/denyhosts/2.6/DenyHosts-2.6.tar.gz && 
tar -zxvf DenyHosts-2.6.tar.gz && 
cd DenyHosts-2.6 &&
python setup.py install && cd /usr/share/denyhosts/ && 
cp daemon-control-dist daemon-control && 
chown root daemon-control && 
chmod 700 daemon-control && 
ln -s /usr/share/denyhosts/daemon-control /etc/init.d && 
/etc/init.d/daemon-control start && 
chkconfig daemon-control on && 
wget https://raw.githubusercontent.com/sunyi369/Denyhost/master/denyhosts.cfg /usr/share/denyhosts/denyhosts.cfg && 
/etc/init.d/daemon-control restart &&
rm -rf /root/DenyHosts-2.6
