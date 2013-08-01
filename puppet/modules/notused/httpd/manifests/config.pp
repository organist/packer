class httpd::config {
    file { "/etc/httpd/sites.d":
        ensure => directory,
        owner => root,
        group => root,
        mode => 744,
        require => Class["httpd::install"]
    }
    
    file { "/etc/httpd/sslsites.d":
        ensure => directory,
        owner => root,
        group => root,
        mode => 0644,
        require => Class["httpd::install"]
    }
    
	file { "/etc/httpd/conf.d/sites.conf":
	    ensure     => file,
	    owner      => root,
	    group      => root,
	    mode       => 0644,
	    source     => $sitesConf,
	    require    => [Class["httpd::install"], File["/etc/httpd/sites.d"]],
        notify     => Service["httpd"]
	}
}