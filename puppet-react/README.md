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

* Install Git, Puppet and Curl through apt-get
* Add latest Node.js repository to package manager
	* Mandatory, as the version of Node provided through apt-get at the time
	of writing doesn't support the Node modules used in this installation
	* Command for this is `curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -`
* Create a directory for Git project
* Pull this Puppet project to the directory
	* Inside directory, type `git clone https://github.com/JuhaPit/Puppet.git`
* Replace Puppet's default content in **/etc/puppet/** with files from the Git repository's **puppet-react**
 directory.
	* Inside the directory you created earlier, type `sudo cp -TRv ./Puppet/puppet-react /etc/puppet` 
	This will overwrite all default content.
	* In the likely case you already have your own data saved in **/etc/puppet/**, just move the files 
	found under **puppet-react**  directory's **modules** folder and modify your site.pp manifest
	accordingly. Note that the module relies on `ordering=manifest` setting in puppet.conf. Be sure to 
	add it if you decide to "cherry-pick" files from the module.

That's it, you're done!

### 1.2 Automatic setup

* Automatic setup does all the same steps as described in heading 1.1
* Directory where this Git project is cloned, "git", is created in user's home directory.
* All default content in **/etc/puppet/** is overwritten. You've been warned.

To run automatic setup, just type `wget -O - https://raw.githubusercontent.com/JuhaPit/Puppet/master/setup-react-env.sh | bash` 
to your Terminal.
