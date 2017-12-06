class react-env {
	$project_path = "/tmp/hello-react"
	File { owner => '0', group => '0', mode => '0644', }
	Package { ensure => 'installed', allowcdrom => true, }
	Exec {cwd => $project_path, }

	package { 'build-essential':}

	file { $project_path:
		ensure => 'directory',
	}

	exec { '/usr/bin/npm init -y':}

	exec { 'npm install webpack -S':
		path => ['/usr/local/node/node-default/bin', '/bin', '/usr/bin'],
        }

	file { "$project_path/webpack.config.js":
		content => template("react-env/webpack_config"),
	}

	file { [ "$project_path/src/", "$project_path/src/client/", "$project_path/src/client/app/" ]:
		ensure => 'directory',
	}

	file { "$project_path/src/client/app/index.jsx":
		content => template("react-env/index_jsx"),
	}

	file { "$project_path/src/client/index.html":
		content => template("react-env/index_html"),
	}

	exec { 'npm install babel-core babel-loader babel-preset-es2015 babel-preset-react -S':
                path => ['/usr/local/node/node-default/bin', '/bin', '/usr/bin'],
        }

	file { "$project_path/.babelrc":
		content => template("react-env/babelrc"),
	}

	exec { 'npm install react react-dom -S':
                path => ['/usr/local/node/node-default/bin', '/bin', '/usr/bin'],
        }

	exec { 'webpack_bundle':
                command => "$project_path/node_modules/.bin/webpack -d",
                path => ['/usr/local/node/node-default/bin', '/bin', '/usr/bin'],
        }
}
