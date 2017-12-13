class react-env {
	$project_path = "/tmp/hello-react"
	$module_path = "$project_path/node_modules"
	$babel_modules = [
				"$module_path/babel-core",
				"$module_path/babel-loader",
				"$module_path/babel-preset-es2015",
				"$module_path/babel-preset-react"
			 ]
	$react_modules = [
				"$module_path/react",
				"$module_path/react-dom"
			 ]
	$exec_path = ['/usr/local/node/node-default/bin', '/bin', '/usr/bin']	

	File { owner => '0', group => '0', mode => '0644', }
	Package { ensure => 'installed', allowcdrom => true, }
	Exec {cwd => $project_path, }

	package { 'nodejs':}

	package { 'build-essential':}

	file { $project_path:
		ensure => 'directory',
	}

	exec { 'Init project with NPM':
		command => '/usr/bin/npm init -y',
		creates => "$project_path/package.json",
	}

	exec { 'Install Webpack':
		command => 'npm install webpack -S',
		path => $exec_path,
		creates => "$project_path/node_modules/webpack/",
        }

	file { "$project_path/webpack.config.js":
		content => template("react-env/webpack_config"),
	}

	file { [ "$project_path/src/", "$project_path/src/client/", "$project_path/src/client/app/", "$project_path/src/server" ]:
		ensure => 'directory',
	}

	file { "$project_path/src/client/app/index.jsx":
		content => template("react-env/index_jsx"),
	}

	file { "$project_path/src/client/index.html":
		content => template("react-env/index_html"),
	}

	exec { 'Install Babel Modules':
		command => 'npm install babel-core babel-loader babel-preset-es2015 babel-preset-react -S',
                path => $exec_path,
		creates => $babel_modules,
        }

	file { "$project_path/.babelrc":
		content => template("react-env/babelrc"),
	}

	exec { 'Install React Modules':
		command => 'npm install react react-dom -S',
                path => $exec_path,
		creates => $react_modules,
        }

	exec { 'Webpack Bundle':
                command => "$project_path/node_modules/.bin/webpack -d",
                path => $exec_path,
		creates => "$project_path/src/client/public/bundle.js",
        }

	exec { 'Install Express':
		command => 'npm install express -S',
		path => $exec_path,
		creates => "$project_path/node_modules/express/",
	}

	file { "$project_path/src/server/app.js":
		content => template("react-env/app.js"),
	}
}
