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
MojoqqGCM(){
	echo "use Mojo::Webqq;
my $client = Mojo::Webqq->new(log_encoding=>"utf-8");
$client->load("ShowMsg");
$client->load("GCM",data=>{
    api_url => 'https://gcm-http.googleapis.com/gcm/send',
    api_key=>'AIzaSyB18io0hduB_3uHxKD3XaebPCecug27ht8',
    registration_ids=>["输入你自己从 GCMForMojo APP中获取到的令牌"],
    allow_group=>["接收群消息的号码，如需要推送全部群消息可删除这一行，每个群号码之间使用 "", 分隔"],
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/qq.pl
}
Mojoqqmi(){
	echo "use Mojo::Webqq;
my $client = Mojo::Webqq->new(log_encoding=>"utf-8");
$client->load("ShowMsg");
$client->load("MiPush",data=>{
    registration_ids=>[""],
    allow_group=>["接收群消息的号码，如需要推送全部群消息可删除这一行，每个群号码之间使用 "", 分隔"],
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/qq.pl
}
Mojoqqopen(){
	echo "$client->load("Openqq",data=>{
    listen => [{host=>"0.0.0.0",port=>5000}, ] ,
    #如果是推送微信的话需要保证端口不重复，并请保证所设定的端口已经在防火墙内放行，同时需要在 APP 内设定好推送服务器的地址和端口
});
#不需要 APP 内回复功能请删除以上三行（不包括被 # 号注释掉的几行）
$client->run();">>/root/qq.pl
}
if [ -f "/root/qq.pl" ]; then
	rm -rf /root/qq.pl
else
	touch /root/qq.pl
fi
echo '是否安装Mojoqq(y/n)'
read select
if [ $select = y ]; then
	MojoqqGCM
	Mojoopen
else
	exit
fi
