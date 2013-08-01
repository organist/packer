class anyterm::config {


    file { "/home/vagrant/src":
        ensure => directory,
        group => 'vagrant',
        owner => 'vagrant'
    }

    file { "/home/vagrant/src/anyterm":
        ensure => directory,
        group => 'vagrant',
        owner => 'vagrant',
        require => File['/home/vagrant/src']
    }

	file { "/home/vagrant/src/anyterm/build.sh":
		ensure => present,
		mode => 0777,
		source => [
            "puppet:///modules/anyterm/build.sh",
        ],
        group => 'vagrant',
        owner => 'vagrant',
        require => File['/home/vagrant/src/anyterm']
	}

	file { "/home/vagrant/src/anyterm/SmtpClient.patch":
		ensure => present,
		source => [
            "puppet:///modules/anyterm/SmtpClient.patch",
        ],
        group => 'vagrant',
        owner => 'vagrant',
        require => File['/home/vagrant/src/anyterm']
	}


}
