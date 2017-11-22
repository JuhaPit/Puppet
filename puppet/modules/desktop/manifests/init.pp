class desktop {
        File { owner => '0', group => '0', mode => '0644', }
        Package { ensure => 'installed', allowcdrom => true, }
	$userhome = '/home/juha'

        package { 'vlc':}

        file { "${userhome}/.bashrc":
                content => template("desktop/.bashrc"),
        }

	file {"${userhome}/.config/xfce4/terminal/terminalrc":
		content => template("desktop/terminalrc"),
	}

	file {"${userhome}/.config/vlc/vlcrc":
		content => template("desktop/vlcrc"),
	}
}

