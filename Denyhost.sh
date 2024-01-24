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

