#!/bin/bash
#======================================================
#	System Required: CentOS 6+,Debian8+,Ubuntu14+
#	Description: GCMforMojo server
#	Version: 1.0.3
#	Author: null-ecp
#	Blog: https://blog.null26.com/
#=======================================================
Centos(){  #centos install about
	yum makecache
	yum -y groupinstall "Development Tools"
	yum install -y vim git openssl-devel \
		perl cpan make gcc g++
}
Fedora(){  #Fedora install about
	dnf -y groupinstall "Development Tools"
	dnf install -y vim git openssl-devel \
		perl cpan make gcc
}
Ubuntu(){  #Ubuntu install about
	apt-get update
	apt-get upgrade
	apt-get -y install build-essential \
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
	echo 'Uninstall GCMforMojo Server,Exiting...'
	sleep 3s
	exit
}
Selecterr(){
	echo 'Input Option error,Exiting...'
	sleep 3s
	exit
}
Mojoqqgcm(){ #MOjoqq GCM about
	echo -e "use Mojo::Webqq;
use Webqq::Encryption qw(pwd_encrypt);
use Digest::MD5 qw(md5_hex);
my \$client = Mojo::Webqq->new(log_encoding=>\"utf-8\",pwd=>Digest::MD5::md5_hex('你的qq密码'));
\$client->load(\"ShowMsg\");
\$client->load(\"GCM\",data=>{
    api_url => 'https://gcm-http.googleapis.com/gcm/send',
    api_key=>'AIzaSyB18io0hduB_3uHxKD3XaebPCecug27ht8',
    registration_ids=>[\"\"],#输入你自己从 GCMForMojo APP中获取到的令牌
    allow_group=>[\"\"],#接收群消息的号码，如需要推送全部群消息可删除这一行，每个群号码之间使用 \"\", 分隔
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/qq.pl
}
Mojowxgcm(){ #mojowx GCM about
	echo "use Mojo::Weixin;
my \$client = Mojo::Weixin->new(log_encoding=>\"utf-8\");
\$client->load(\"ShowMsg\");
\$client->load(\"GCM\",data=>{
    api_url => 'https://gcm-http.googleapis.com/gcm/send',
    api_key=>'AIzaSyB18io0hduB_3uHxKD3XaebPCecug27ht8',
    registration_ids=>[\"\"],#输入你自己从 GCMForMojo APP中获取到的令牌
    allow_group=>[\"\"],#接收消息的群名称，不填则接收全部\"\", 分隔
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/wx.pl
}
Mojoqqmi(){  #mojoqq mipush about
	echo "use Mojo::Webqq;
use Webqq::Encryption qw(pwd_encrypt);
use Digest::MD5 qw(md5_hex);
my \$client = Mojo::Webqq->new(log_encoding=>\"utf-8\",pwd=>Digest::MD5::md5_hex('你的qq密码'));
\$client->load(\"ShowMsg\");
\$client->load(\"MiPush\",data=>{
    registration_ids=>[\"\"],#输入你自己从 GCMForMojo APP中获取到的令牌
    allow_group=>[\"\"],#接收群消息的号码，如需要推送全部群消息可删除这一行，每个群号码之间使用 \"\", 分隔
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/qq.pl
}
Mojowxmi(){  #mojowx mipush about
	echo "use Mojo::Weixin;
my \$client = Mojo::Weixin->new(log_encoding=>\"utf-8\");
\$client->load(\"ShowMsg\");
\$client->load(\"MiPush\",data=>{
    registration_ids=>[\"\"],#输入你自己从 GCMForMojo APP中获取到的令牌
    allow_group=>[\"\"],#接收群消息的名称，如需要推送全部群消息可删除这一行，每个群号码之间使用 \"\", 分隔
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/wx.pl
}
Mojoqqopen(){  #openqq
	echo "\$client->load(\"Openqq\",data=>{
    listen => [{host=>\"0.0.0.0\",port=>5000}, ] ,
});
#不需要 APP 内回复功能请删除以上三行（不包括被 # 号注释掉的几行）
\$client->run();">>/root/qq.pl
}
Mojowxopen(){  #openwx
	echo "\$client->load(\"Openwx\",data=>{
    listen => [{host=>\"0.0.0.0\",port=>5000}, ] ,
});
#不需要 APP 内回复功能请删除以上三行（不包括被 # 号注释掉的几行）
\$client->run();">>/root/wx.pl
}
delqq(){  #judgment qq.pl
	if [ -f "/root/qq.pl" ]; then
		rm -rf /root/qq.pl
	else
		touch /root/qq.pl
	fi
}
delwx(){  #judgment wx.pl
	if [ -f "/root/wx.pl" ]; then
		rm -rf /root/wx.pl
	else
		touch /root/wx.pl
	fi
}
Pselect(){
	echo 'Which version do you want to install?(input Option number)
1) GCM push
2) Mipush
--------------------------------------------'
}
Tselect(){
	echo 'Which version do you want to install?(input Option number)
1) GCMforMojoqq
2) GCMforMojowx
--------------------------------------------'
}
Installgfm(){
	Tselect
	read tversion
	if [ $tversion = 1 ]; then #install mojoqq
		Pselect
		read pversion
		if [ $pversion = 1 ]; then #install 
			echo 'you select install Mojoqq GCM push ,the server installing ...'
			sleep 3s
			delqq
			Mojoqqgcm
			Mojoqqopen
		elif [ $pversion = 2 ]; then
			echo 'you select install Mojoqq Mi push ,the server installing ...'
			sleep 3s
			delqq
			Mojoqqmi
			Mojoqqopen
		else
			Selecterr
		fi
	elif [ $tversion = 2 ]; then #installmojowx
		Pselect
		read pversion
		if [ $pversion = 1 ]; then #install 
			echo 'you select install Mojowx GCM push ,the server installing ...'
			sleep 3s
			delwx
			Mojowxgcm
			Mojowxopen
		elif [ $pversion = 2 ]; then
			echo 'you select install Mojowx Mi push ,the server installing ...'
			sleep 3s
			delwx
			Mojowxmi
			Mojowxopen
		else
			Selecterr
		fi
	else
		Selecterr
	fi
}
# system select and GCMformojo version select
echo -e 'Please select your system(input Option number)
1)Centos
2)Ubuntu
3)debian
4)Fedora
-----------------------------------------'
read sysnum
if [ $sysnum = 1 ]; then
	echo 'Do you want to install Centos’s GCMforMojo?(y/n)
-----------------------------------------'
	read temp
	if [ $temp = y ]; then
		Installgfm
		sleep 3s
		Centos
	elif [ $temp = n ]; then
		Uninstall
	else
		Selecterr
	fi
elif [ $sysnum = 2 ]; then
	echo 'Do you want to install Ubuntu’s FFM?(y/n)
---------------------------------'
	read temp
	if [ $temp = y ]; then
		Installgfm
		sleep 3s
		Ubuntu
	elif [ $temp = n ]; then
		Uninstall
	else
		Selecterr
	fi
elif [ $sysnum = 3 ]; then
	echo 'Do you want to install Debian’s FFM?(y/n)
---------------------------------'
	read temp
	if [ $temp = y ]; then
		Installgfm
		sleep 3s
		Debian
	elif [ $temp = n ]; then
		Uninstall
	else
		Selecterr
	fi
elif [ $sysnum = 4 ]; then
	echo 'Do you want to install Fedora’s FFM?(y/n)
---------------------------------'
	read temp
	if [ $temp = y ]; then
		Installgfm
		sleep 3s
		Fedora
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
#install Mojowx
for i in $(seq 1 3):
do
	cpanm Mojo::Weixin
	sleep 2s
done

cd
