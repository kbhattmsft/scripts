#!/bin/bash
#
yum -y update
#install docker
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum install -y docker-ce
systemctl start docker
systemctl enable docker
#user management
groupadd docker
usermod -aG docker channelsadmin
#
#install xrdp
rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
#
#install deps
yum -y groupinstall "GNOME Desktop" "Graphical Administration Tools"
yum -y install xrdp tigervnc-server
#configure service
systemctl start xrdp.service
systemctl enable xrdp.service
#
shutdown -r now
