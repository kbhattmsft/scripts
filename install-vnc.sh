#!/bin/bash
#install repos
rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
#install deps
yum -y install xrdp tigervnc-server
#configure service
systemctl start xrdp.service
systemctl enable xrdp.service
#change firewall
firewall-cmd --permanent --zone=public --add-port=3389/tcp
firewall-cmd --reload
#apply SELinux
chcon --type=bin_t /usr/sbin/xrdp
chcon --type=bin_t /usr/sbin/xrdp-sesman
