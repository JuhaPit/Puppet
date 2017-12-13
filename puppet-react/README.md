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

To run automatic setup, just type:

`wget -O - https://raw.githubusercontent.com/JuhaPit/Puppet/master/setup-react-env.sh | bash`
 
to your Terminal.

## 2. Description

This module installs React.js, utilizing Webpack, Babel and Node.js to make a fully 
functioning web-development environment.

**React.js** is an extremely popular framework for front-end development, developed by Facebook.
After developer backlash not so long ago, Facebook re-licensed React under the MIT license.
Shortly described, you are free to use, copy, modify, merge, publish and distribute the framework 
and sell software utilizing it.

For beginners, I highly suggest reading this blog post by Andrew Ray: [ReactJS For Beginners](https://blog.andrewray.me/reactjs-for-stupid-people/)

**Webpack** is a build tool that puts all of your assets, including JS scripts, images and CSS in a dependency 
graph. This let's you use `require()` in your source code to point to local files and decide how they're 
processed in your Javascript bundle.

Andrew Ray has also written a blog post about Webpack in case your not familiar with it: [Webpack: When To Use And Why](https://blog.andrewray.me/webpack-when-to-use-and-why/)

**Babel** is a tool for compiling newer ES6/ES7 code to plain old ES5 code, which can be used today in any 
modern browser. When used with React, you will want to set it to compile React JSX syntax as well.
We'll come back to this.

**Node.js** is a popular backend framework using Javascript. It comes with its own Node Package Manager
(npm), which can be used to easily install new modules to use in your code. Node keeps track of your 
dependencies in a package.json file, so actual code from the modules doesn't need to be transferred when 
moving the project to other computers/servers. In these cases, installing the app with npm will
automatically download all modules it deems missing.

In this module, Node.js is used for setting up the localhost server.

## 3. Breaking down the demo

Outside regular Node module installations, the demo consists of:

* index.html
	* Ultimately the page displayed in browser.
* index.jsx
	* A jsx-file written with React, responsible for the content on index.html.
* .babelrc
	* Setting the presets for ES6->ES5 and React JSX syntax compiling.
* webpack.config
	* Initializes the entry point for asset bundling, output location and file name.
* app.js
	* Starts a server in localhost:3000, running the app.

## 4. Running the module

After executing Automatic setup, type `sudo puppet apply /etc/puppet/manifests/site.pp` 
to run the module. Of course, if you made alterations, adjust accordingly.

The demo project is saved in /tmp/hello-react. I recommend moving it somewhere else, e.g. home directory.

To start the app in localhost, navigate to hello-react/src/server and type `node app.js`

Enjoy!





