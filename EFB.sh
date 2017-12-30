#!/bin/bash
#======================================================
#	System Required: Ubuntu14+
#	Description: Telegram EFB server
#	Version: 1.0.0
#	Author: null-ecp
#	Blog: https://blog.null26.com/
#=======================================================

#install efb about
clear
echo "==========================================================================
are you sure your system is Ubuntu?(y/n)"
read select
if [ $select = n ]; then
  echo "uninstalling ,system exit..."
  sleep 3s
  exit
fi
apt-get update
apt-get install python3-dev python3 libwebp-dev libmagic-dev libopus0 libmagic1 python3-pip python3-setuptools git gcc gcc-multilib libtiff5-dev libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev tcl8.5-dev tk8.5-dev python3-tk vim -y
pip3 install --upgrade pip
git clone https://github.com/blueset/ehForwarderBot.git
cd ehForwarderBot
pip3 install -U future certifi tqdm numpy imageio decorator
pip3 install -Ur requirements.txt
mkdir storage
chmod +rw ./storage
cp config.sample.py config.py
