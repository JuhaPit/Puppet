#!/bin/bash

echo "---Installing mandatory packages---"
sudo apt-get update
sudo apt-get install -y git puppet curl

echo "---Add latest Node.js repository to package manager---"
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

echo "---Creating folders, pulling repository---"
cd /home/$(whoami)
mkdir -p git
cd git
git clone https://github.com/JuhaPit/Puppet.git

echo "---Replacing Puppet's default content in /etc/puppet with content from repository---"
sudo cp -TRv ./Puppet/puppet-react /etc/puppet
