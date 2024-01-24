yum install gcc make -y
wget "https://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz"
tar -zxvf Python-2.7.5.tgz
cd Python-2.7.5
./configure --prefix=/usr/local/python2.7.5 --enable-unicode=ucs4 --enable-shared
make
make install
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
daemon-control restart
rm -rf /root/DenyHosts-2.6
