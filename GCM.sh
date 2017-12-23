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
	echo 'Uninstall GCM Server,Exiting...'
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
MojowxGCM(){
	echo "use Mojo::Weixin;
my $client = Mojo::Weixin->new(log_encoding=>"utf-8");
$client->load("ShowMsg");
$client->load("GCM",data=>{
    api_url => 'https://gcm-http.googleapis.com/gcm/send',
    api_key=>'AIzaSyB18io0hduB_3uHxKD3XaebPCecug27ht8',
    registration_ids=>["输入你自己从 GCMForMojo APP中获取到的令牌"],
    allow_group=>["接收消息的群名称，不填则接收全部"", 分隔"],
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/wx.pl
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
Mojowxmi(){
	echo "use Mojo::Weixin;
my $client = Mojo::Weixin->new(log_encoding=>"utf-8");
$client->load("ShowMsg");
$client->load("MiPush",data=>{
    registration_ids=>[""],
    allow_group=>["接收群消息的名称，如需要推送全部群消息可删除这一行，每个群号码之间使用 "", 分隔"],
    ban_group=>[],
    allow_discuss=>[],
    ban_discuss=>[],
    #此处为讨论组，填写格式同上
});">>/root/wx.pl
}
Mojoqqopen(){
	echo "$client->load("Openqq",data=>{
    listen => [{host=>"0.0.0.0",port=>5000}, ] ,
});
#不需要 APP 内回复功能请删除以上三行（不包括被 # 号注释掉的几行）
$client->run();">>/root/qq.pl
}
Mojowxopen(){
	echo "$client->load("Openwx",data=>{
    listen => [{host=>"0.0.0.0",port=>5000}, ] ,
});
#不需要 APP 内回复功能请删除以上三行（不包括被 # 号注释掉的几行）
$client->run();">>/root/wx.pl
}
delqq(){
	if [ -f "/root/qq.pl" ]; then
		rm -rf /root/qq.pl
	else
		touch /root/qq.pl
	fi
}
echo 'are you want del qq?(y/n)'
read result
if [ $result = y ]; then
	delqq
fi
