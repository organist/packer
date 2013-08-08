class organist::config {

	file { "/home/deploy/install.sh":
		ensure => present,
		mode => 0777,
		source => [
            "puppet:///modules/organist/install.sh",
        ],
        group => 'deploy',
        owner => 'deploy'
	}

}