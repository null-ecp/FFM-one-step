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
		libssl-dev curl build-essential screen git \
		libnet-ssleay-perl libio-socket-ssl-perl
}
Uninstall(){
	echo 'Uninstall FFM Server,Exiting...'
	sleep 3s
	exit
}
Selecterr(){
	echo 'Input Option error,Exiting...'
	sleep 3s
	exit
}
#system select
echo -e 'Please select your system(input Option number)
1)Centos
2)Ubuntu
3)debian
-----------------------------------------'
read sysnum
if [ $sysnum = 1 ]; then
	echo 'Do you want to install Centos’s GCM?(y/n)
-----------------------------------------'
	read temp
	if [ $temp = y ]; then
		echo 'Installing Centos‘s GCM...'
		sleep 3s
		Centos
	elif [ $temp = n ]; then
		Uninstall
	else
		Selecterr
	fi
elif [ $sysnum = 2 ]; then
	echo 'Do you want to install Ubuntu’s GCM?(y/n)
---------------------------------'
	read temp
	if [ $temp = y ]; then
		echo 'Installing Ubuntu‘s GCM...'
		sleep 3s
		Ubuntu
	elif [ $temp = n ]; then
		Uninstall
	else
		Selecterr
	fi
elif [ $sysnum = 3 ]; then
	echo 'Do you want to install Debian’s GCM?(y/n)
---------------------------------'
	read temp
	if [ $temp = y ]; then
		echo 'Installing Debian‘s GCM...'
		sleep 3s
		Debian
	elif [ $temp = n ]; then
		Uninstall
	else
		Selecterr
	fi
else
	Selecterr
fi

#install cpanm
curl -L https://cpanmin.us | perl - App::cpanminus

#install Mojoqq
for i in $(seq 1 3):
do
	cpanm Mojo::Webqq
	sleep 2s
done

if [ -f "~/qq.pl" ]; then
	rm -rf ~/qq.pl
else 
	touch ~/qq.pl
fi
echo -e 'use Mojo::Webqq;
my $client = Mojo::Webqq->new(log_encoding=>"utf-8");
$client->load("ShowMsg");
#请根据自己所需的推送服务进行选择并删除或注释不需要的部分，填写格式请仿照 GCM 的方式填写
#以下为 GCM 推送
$client->load("GCM",data=>{
    	api_url => \'https://gcm-http.googleapis.com/gcm/send\',
    	api_key=>\'AIzaSyB18io0hduB_3uHxKD3XaebPCecug27ht8\',
    	registration_ids=>["输入你自己从 GCMForMojo APP中获取到的令牌"],
    	allow_group=>["接收群消息的号码，如需要推送全部群消息可删除这一行，每个群号码之间使用 "", 分隔"],
    	ban_group=>[],
    	allow_discuss=>[],
    	ban_discuss=>[],
    	#此处为讨论组，填写格式同上
});
#以下为 MiPush 推送
$client->load("MiPush",data=>{
    	registration_ids=>[""],
    	allow_group=>[""],
   	ban_group=>[],
    	allow_discuss=>[],
    	ban_discuss=>[],
});
$client->load("Openqq",data=>{
    	listen => [{host=>"0.0.0.0",port=>5000}, ] ,
    	#如果是推送微信的话需要保证端口不重复，并请保证所设定的端口已经在防火墙内放行，同时需要在 APP 内设定好推送服务器的地址和端口
});
#不需要 APP 内回复功能请删除以上三行（不包括被 # 号注释掉的几行）
$client->run();'>>~/qq.pl

cd
