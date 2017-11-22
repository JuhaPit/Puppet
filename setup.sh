#!/bin/bash

echo "---Setting keyboard to Finnish layout---"
setxkbmap fi

echo "---Updating package repositories---"
sudo apt-get update

echo "---Installing Git, Puppet and PuppetMaster---"
sudo apt-get install -y git puppet puppetmaster

echo "---Changing name to juhamaster---"
sudo hostnamectl set-hostname juhamaster

echo "---Creating Git-folder to users home directory and pulling repository---"
cd /home/$(whoami)/
mkdir git
cd git
git clone https://github.com/JuhaPit/Puppet.git

echo "---Replacing Puppet's default content in /etc/puppet with content from repository---"
sudo cp -TRv ./Puppet/puppet /etc/puppet

echo "---Saving picture for Terminal background---"

sudo cp ./Puppet/JTerminalTausta.jpg /home/$(whoami)/Downloads

echo "---Running Puppet's site.pp, installing SSH daemon, set Terminal and VLC settings---"
sudo puppet apply /etc/puppet/manifests/site.pp
