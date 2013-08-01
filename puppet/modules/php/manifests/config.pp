class php::config {
	file { "/etc/php.ini":
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///modules/php/php.ini",
		require => Class["php::install"]
	}

	file { "/etc/php.d/xdebug.ini":
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///modules/php/xdebug.ini",
		require => Class["php::install"]
	}

	file { "/etc/php-fpm.d/www.conf":
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///modules/php/www.conf",
		require => Class["php::install"]
	}

    service { "php-fpm":
        enable => true,
        ensure => "running",
        hasrestart => true,
    }
}
