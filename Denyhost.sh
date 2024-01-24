wget "https://nchc.dl.sourceforge.net/project/denyhosts/denyhosts/2.6/DenyHosts-2.6.tar.gz"
tar -zxvf DenyHosts-2.6.tar.gz
cd DenyHosts-2.6
python setup.py install
cd /usr/share/denyhosts/
cp /usr/local/share/denyhosts/daemon-control-dist /usr/local/bin/daemon-control
chmod 700 /usr/local/bin/daemon-control
daemon-control start
chkconfig daemon-control on
wget https://raw.githubusercontent.com/sunyi369/Denyhost/master/denyhosts.cfg /usr/share/denyhosts/denyhosts.cfg
/etc/init.d/daemon-control restart
rm -rf /root/DenyHosts-2.6
