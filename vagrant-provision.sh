#!/usr/bin/env bash
sudo sh -c "(echo && echo \#Appended during Vagrant provisioning && echo 127.0.1.1 `hostname`) >> /etc/hosts"
apt-get -y install puppet-common
if [ -e "/etc/puppet/modules/nodejs" ]; then
  puppet module upgrade willdurand/nodejs
else 
  puppet module install willdurand/nodejs
fi
