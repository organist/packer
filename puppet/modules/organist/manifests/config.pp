class organist::config {

	file { "/home/deploy/install_organist.sh":
		ensure => present,
		mode => 0777,
		source => [
            "puppet:///modules/organist/install_organist.sh",
        ],
        group => 'deploy',
        owner => 'deploy'
	}

	file { "/home/deploy/install_vendors.sh":
		ensure => present,
		mode => 0777,
		source => [
            "puppet:///modules/organist/install_vendors.sh",
        ],
        group => 'deploy',
        owner => 'deploy'
	}

	file { "/home/deploy/install_anytermservice.sh":
		ensure => present,
		mode => 0777,
		source => [
            "puppet:///modules/organist/install_anytermservice.sh",
        ],
        group => 'deploy',
        owner => 'deploy'
	}
}