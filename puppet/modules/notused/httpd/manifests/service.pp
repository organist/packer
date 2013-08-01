class httpd::service {
	service { "httpd":
        enable => true,
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        require => Package[httpd]
	}
}