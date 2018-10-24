#!/bin/bash
#===============================================================
#     System Required:   CentOS 6+,Debian8+,Ubuntu14+,Fedora 26+
#     Description:       uninstall FFMforMojo server
#     Version:           1.0.0
#     Author:            null-ecp
#     Blog:              https://www.null26.com/
#===============================================================

#rm node
rm -rf /usr/local/src/node*

#uninstall mojo moudle
cpanm App::pmuninstall
pm-uninstall IO::Socket::SSL Mojo::Webqq Webqq::Encryption -f

#del Mojo-server source
if [ -d "~/FCM-for-Mojo-Server" ]; then
	rm -rf ~/FCM-for-Mojo-Server
fi

#del node path
for i in $(seq 1 3):
do
  sed '$d' -i ~/.bashrc;
done

#del hosts
sed '$d' -i /etc/hosts

#del centos rely
cat /etc/os-release | grep ID=centos
if [ $? -eq 0 ];then
  yum makecache
	yum -y groupremove "Development Tools"
	yum remove -y openssl-devel \
	  cpan make gcc \
		perl-Crypt-OpenSSL-RSA
fi

#del ubuntu rely
cat /etc/os-release | grep ID=ubuntu
if [ $? -eq 0 ];then
  apt-get remove -y build-essential libssl-dev \
		libcrypt-openssl-bignum-perl \
		libcrypt-openssl-rsa-perl
  apt-get autoremove
fi

#del debian rely
cat /etc/os-release | grep ID=debian
if [ $? -eq 0 ];then
  apt-get -y install openssl ca-certificates \
		libssl-dev curl build-essential \
		libnet-ssleay-perl libio-socket-ssl-perl \
		libcrypt-openssl-bignum-perl libcrypt-openssl-rsa-perl
fi

#del fedora rely
cat /etc/os-release | grep ID=fedora
if [ $? -eq 0 ];then
  dnf -y groupremove "Development Tools"
	dnf remove -y openssl-devel \
		cpan make gcc \
		perl-Crypt-OpenSSL-RSA
fi
