#!/bin/bash

echo "---Setting keyboard to Finnish layout---"
setxkbmap fi

echo "---Updating package repositories---"
sudo apt-get update

echo "---Installing Git and Puppet---"
sudo apt-get install -y git puppet

echo "---Creating folders, pulling repository---"
cd /home/$(whoami)
mkdir -p git
cd git
git clone https://github.com/JuhaPit/Puppet.git

echo "---Replacing Puppet's default content in /etc/puppet with content from repository---"
sudo cp -TRv ./Puppet/puppet-react /etc/puppet

echo "---Running Puppet's site.pp, installing React.js environment---"
sudo puppet apply /etc/puppet/manifests/site.pp

echo "---Move files to user's home directory---"
cp -r /tmp/hello-react/ /home/$(whoami)/
