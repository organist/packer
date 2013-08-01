class development::install {
	package {
		[
			"php-pecl-xdebug",
			"php-phpunit-PHPUnit",
			"php-phpunit-DbUnit",
			"php-pdepend-PHP-Depend",
			"php-phpmd-PHP-PMD",
			"php-phpunit-phploc",
			"rubygems",
			"mlocate",
			"mod_ssl"
		] :
		ensure => latest
	}
	
	package { "sass":
		provider => "gem",
		ensure => latest,
		require => Package["rubygems"]
	}
	package { "compass" :
		provider => "gem",
		ensure => latest,
		require => Package["rubygems"]
	}
}
