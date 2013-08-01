class netvlies::config {


    file { "/home/deploy/.ssh":
        ensure => "directory",
        owner => 'deploy',
        group => 'deploy',
        mode => 0700,
    }

	file { "/home/deploy/.ssh/config":
		ensure => present,
		owner => 'deploy',
		group => 'deploy',
		mode => 0600,
		source => "puppet:///modules/netvlies/config",
		require => file["/home/deploy/.ssh"]
	}

	file { "/home/deploy/.ssh/id_rsa_bitbucket":
		ensure => present,
		owner => 'deploy',
		group => 'deploy',
		mode => 0600,
		source => "puppet:///modules/netvlies/id_rsa_bitbucket",
		require => file["/home/deploy/.ssh"]
	}

	file { "/home/deploy/.ssh/id_rsa_bitbucket.pub":
		ensure => present,
		owner => 'deploy',
		group => 'deploy',
		mode => 0600,
		source => "puppet:///modules/netvlies/id_rsa_bitbucket.pub",
		require => file["/home/deploy/.ssh"]
	}

	file { "/home/deploy/.ssh/id_rsa_deploy":
		ensure => present,
		owner => 'deploy',
		group => 'deploy',
		mode => 0600,
		source => "puppet:///modules/netvlies/id_rsa_deploy",
		require => file["/home/deploy/.ssh"]
	}

	file { "/home/deploy/.ssh/id_rsa_deploy.pub":
		ensure => present,
		owner => 'deploy',
		group => 'deploy',
		mode => 0600,
		source => "puppet:///modules/netvlies/id_rsa_deploy.pub",
		require => file["/home/deploy/.ssh"]
	}
}
