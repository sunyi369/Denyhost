yum install wget -y && wget https://nchc.dl.sourceforge.net/project/denyhosts/denyhosts/2.6/DenyHosts-2.6.tar.gz
tar zxvf DenyHosts-2.6.tar.gz                             #解压源码包
cd DenyHosts-2.6                                          #进入安装解压目录
python setup.py install                                   #安装DenyHosts
cd /usr/share/denyhosts/                                  #默认安装路径
cp denyhosts.cfg-dist denyhosts.cfg                       #denyhosts.cfg为配置文件
cp daemon-control-dist daemon-control                     #daemon-control为启动程序
chown root daemon-control                                 #添加root权限
chmod 700 daemon-control                                  #修改为可执行文件
ln -s /usr/share/denyhosts/daemon-control /etc/init.d     #对daemon-control进行软连接，方便管理
/etc/init.d/daemon-control start                          #启动denyhosts
chkconfig daemon-control on                               #将denghosts设成开机启动

/etc/init.d/daemon-control restart         #重启denyhosts