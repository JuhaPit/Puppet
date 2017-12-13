# React.js environment with Webpack, Babel and Node.js

This Puppet module will install a React.js development environment utilizing Webpack and 
Babel and includes a simple demo app. Node.js is used to provide a server setup, 
so the demo can be run in localhost.

**This module has only been tested with Xubuntu 16.04.3, although there shouldn't be any issues 
while using other Debian and Ubuntu based Linux distributions.**

## 1. Getting started

In order to use this module, there are some prerequisite tasks to take care of.
Below you'll find instructions for manual and automatic setup.

### 1.1 Manual setup

Open Terminal and run these commands in order:

* sudo apt-get update
	* Updates package repositories
* sudo apt-get install -y git puppet curl
	* Installs these mandatory packages
* curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
	* Adds the latest Node.js repository to package manager. Necessary step, as the Node
	version provided by apt-get at the time of writing doesn't support Node modules used in this
	installation
* 
