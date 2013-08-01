class system::config{

    yumrepo { "Remi":
        mirrorlist => "http://rpms.famillecollet.com/enterprise/6/remi/mirror",
        descr => "Les RPM de Remi",
        enabled => 1,
        gpgcheck => 0
    }

    yumrepo { "EPEL":
        mirrorlist => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=x86_64",
        descr => "EPEL repository",
        enabled => 1,
        gpgcheck => 0
    }

    yumrepo { "Nginx":
        baseurl => "http://nginx.org/packages/centos/6/x86_64/",
        descr => "nginx repo",
        gpgcheck => 0,
        enabled => 1
    }


	user { "deploy":
   		comment => 'This user was created by Puppet',
   		ensure => 'present',
   		managehome => true,
	}

    file { "/home/deploy":
        ensure => directory,
        mode => 755,
        require => User['deploy']
    }

    # Needed before nginx is installed
    file { [ "/home/deploy/organist/", "/home/deploy/organist/log" ]:
        ensure => "directory",
        owner => 'deploy',
        group => 'deploy',
        require => User['deploy']
    }

    host {'self':
        ensure       => present,
        name         => $fqdn,
        host_aliases => ['puppet', $hostname],
        ip           => $ipaddress_eth1,
    }

}
