#!/bin/bash
Centos(){  #centos install about
	yum makecache
	yum -y groupinstall "Development Tools"
	yum install vim git openssl-devel \
		perl cpan make gcc g++
}
Ubuntu(){  #Ubuntu install about
	apt-get update
	apt-get upgrade
	apt-get install build-essential \
		perl vim libssl-dev \
		curl screen git
}
Debian(){  #Debian install about
	apt-get update
	apt-get -y install perl vim openssl ca-certificates \
		libssl-dev curl build-essential screen git
}
#system select
echo -e 'Please select your system(input Option number)
1)Centos
2)Ubuntu
3)debian
-----------------------------------------'
read sysnum
if [ $sysnum = 1 ]; then
	echo 'Do you want to install Centos’s FFM?(y/n)
-----------------------------------------'
	read temp
	if [ $temp = y ]; then
		echo 'Installing Centos‘s FFM...'
		sleep 3s
		Centos
	elif [ $temp = n ]; then
		echo 'Uninstall Centos‘s FFM,Exiting...'
		sleep 3s
		exit
	else
		echo 'Input Option error,Exiting...'
		sleep 3s
		exit
	fi
elif [ $sysnum = 2 ]; then
	echo 'Do you want to install Ubuntu’s FFM?(y/n)
---------------------------------'
	read temp
	if [ $temp = y ]; then
		echo 'Installing Ubuntu‘s FFM...'
		sleep 3s
		Ubuntu
	elif [ $temp = n ]; then
		echo 'Uninstall Ubuntu’s FFM,Exiting...'
		sleep 3s
		exit
	else
		echo 'Input Option error,Exiting...'
		sleep 3s
		exit
	fi
elif [ $sysnum = 3 ]; then
	echo 'Do you want to install Debian’s FFM?(y/n)
---------------------------------'
	read temp
	if [ $temp = y ]; then
		echo 'Installing Debian‘s FFM...'
		sleep 3s
		Debian
	elif [ $temp = n ]; then
		echo 'Uninstall Debian’s FFM,Exiting...'
		sleep 3s
		exit
	else
		echo 'Input option error,Exiting...'
		sleep 3s
		exit
	fi
else
	echo 'Input option error,Exiting...'
	sleep 3s
	exit
fi

#install cpanm
curl -L https://cpanmin.us | perl - App::cpanminus

#install Mojoqq
for i in $(seq 1 3):
do
	cpanm Mojo::Webqq
	sleep 2s
done

#install nodejs
cd /usr/local/src
wget https://nodejs.org/dist/v9.3.0/node-v9.3.0-linux-x64.tar.gz
        tar zxvf node-v9.3.0-linux-x64.tar.gz
        echo 'export NODE_HOME=/usr/local/src/node-v9.3.0-linux-x64
export PATH=$PATH:$NODE_HOME/bin
export NODE_PATH=$PATH:$NODE_HOME/lib/node_modules'>>~/.bashrc
source ~/.bashrc

#install FFM Server
cd
if [ -d "~/FCM-for-Mojo-Server" ]; then
	rm -rf ~/FCM-for-Mojo-Server
fi
git clone https://github.com/RikkaApps/FCM-for-Mojo-Server.git
cd FCM-for-Mojo-Server
cp config.example.js config.js
npm install
