yum install wget -y && wget https://nchc.dl.sourceforge.net/project/denyhosts/denyhosts/2.6/DenyHosts-2.6.tar.gz
tar zxvf DenyHosts-2.6.tar.gz                             #��ѹԴ���
cd DenyHosts-2.6                                          #���밲װ��ѹĿ¼
python setup.py install                                   #��װDenyHosts
cd /usr/share/denyhosts/                                  #Ĭ�ϰ�װ·��
cp denyhosts.cfg-dist denyhosts.cfg                       #denyhosts.cfgΪ�����ļ�
cp daemon-control-dist daemon-control                     #daemon-controlΪ��������
chown root daemon-control                                 #���rootȨ��
chmod 700 daemon-control                                  #�޸�Ϊ��ִ���ļ�
ln -s /usr/share/denyhosts/daemon-control /etc/init.d     #��daemon-control���������ӣ��������
/etc/init.d/daemon-control start                          #����denyhosts
chkconfig daemon-control on                               #��denghosts��ɿ�������

/etc/init.d/daemon-control restart         #����denyhosts