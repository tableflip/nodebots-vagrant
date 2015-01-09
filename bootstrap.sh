#!/usr/bin/env bash

# adds Node sources and runs `apt-get update`
curl -sL https://deb.nodesource.com/setup | bash -

apt-get upgrade -y
apt-get install -y nodejs build-essential git chromium-browser xfce4 virtualbox-guest-dkms

# enable virtual box features
VBoxClient --display
VBoxClient --clipboard

# make NPM show us useful things
npm config set spin=false
npm config set loglevel=http

# install node dependencies
npm install -g johnny-five nodebot-workshop node-inspector

# allow anyone to start the desktop
sed -i 's/allowed_users=console/allowed_users=anybody/g' /etc/X11/Xwrapper.config

# remote old panel layout
rm -rf /etc/xdg/xfce4/panel/default.xml

# make sur the config directory exists
mkdir -p /home/vagrant/.config

# set up chromium
tar -xzf /vagrant/assets/chromium.tar.gz -C /home/vagrant/.config

# setup xfce4
tar -xzf /vagrant/assets/xfce4.tar.gz -C /home/vagrant/.config

# make sure the vagrant user can access their own config directory
chown -R vagrant:vagrant /home/vagrant/.config

# give use access to serial ports
usermod -a -G dialout vagrant
