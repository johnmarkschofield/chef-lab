#!/bin/bash

CHEFURL="https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/"
CHEFVERSION="11.0.12-1"
CHEFPACKAGE="chef-server_${CHEFVERSION}.ubuntu.12.04_amd64.deb"
export DEBIAN_FRONTEND=noninteractive

if [ ! -e /root/${CHEFPACKAGE} ]; then
	curl -s -L ${CHEFURL}${CHEFPACKAGE} -o /root/${CHEFPACKAGE}
fi

dpkg -l chef-server 2>&1 | grep -q $CHEFVERSION
if [ $? -ne 0 ]; then
	dpkg -i /root/${CHEFPACKAGE}
fi

chef-server-ctl reconfigure

apt-get -yq install make

gem list --local | grep -q berkshelf
if [ $? -ne 0 ]; then
	gem install berkshelf
fi

cd /vagrant
berks install
