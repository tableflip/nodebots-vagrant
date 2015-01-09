#!/usr/bin/env bash

# Adds Node sources and runs `apt-get update`
curl -sL https://deb.nodesource.com/setup | bash -

apt-get upgrade -y
apt-get install -y nodejs build-essential git chromium-browser xfce4 virtualbox-guest-dkms

# Enable virtual box features
VBoxClient --display
VBoxClient --clipboard

# Make NPM show us useful things
npm config set spin=false
npm config set loglevel=http

# Install node dependencies
npm install -g johnny-five nodebot-workshop node-inspector

# allow anyone to start the desktop
sed -i 's/allowed_users=console/allowed_users=anybody/g' /etc/X11/Xwrapper.config

# remote old panel layout
rm -rf /etc/xdg/xfce4/panel/default.xml

# setup chromium and xfce4
mkdir -p /home/vagrant/.config
tar -xzf /vagrant/assets/chromium.tar.gz -C /home/vagrant/.config
tar -xzf /vagrant/assets/xfce4.tar.gz -C /home/vagrant/.config
chown -R vagrant:vagrant /home/vagrant/.config

# Give use access to serial ports
usermod -a -G dialout vagrant
