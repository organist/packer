class php::install {

	package {
		[
			"php-cli",
			"php-bcmath",
			"php-common",
			"php-devel",
			"php-gd",
			"php-imap",
			"php-mbstring",
			"php-mcrypt",
			"php-mysql",
			"php",
			"php-soap",
			"php-tidy",
			"php-xml",
			"php-xmlrpc",
			"php-intl",
			"php-pecl-imagick",
			"php-pecl-apc",
			"php-process",
			"php-fpm",
			"php-pecl-xdebug"
		]:
		ensure => latest,
		require => Yumrepo['Remi']
	}



}

