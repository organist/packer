class development::config {
	
	# todo: create a class for this
	user { "deploy":
   		comment => 'This user was created by Puppet',
   		ensure => 'present',
   		managehome => true
	}
	
	file { "/home/deploy":
    	ensure => 'directory',
    	require => User['deploy'],
    	owner => 'deploy',
    	group => 'deploy',
    	mode => '700',
	}
	
	file { "/home/deploy/.ssh":
    	ensure => 'directory',
    	require => User['deploy'],
    	owner => 'deploy',
    	mode => '700',
	}
	
	ssh_authorized_key { "deploy-rsa-key":
   		ensure => 'present',
   		key => 'ssh-dss AAAAB3NzaC1kc3MAAACBAM3/YpZcWQh8VcSFYkslnRPVSDeciTq2oK+bbJec12I52jfISCp82YWjIP0GUBVEbgO7ZI2sR1U95gtUmYkhA/6FTaIIdfjezLexacRpP+2j8V74OF07gS3qPVvBjthXKMEQEG7homA0PUcZXMqXshB7RKm+hkPe5MQnhqXvHidXAAAAFQC2WI5digTHa7sDrcZ0Gd1vyR7i0QAAAIBlfbYe5MmrfnwixaH+AR85q9VVaDYfsF/NZU6QwiZMzMtPyIn3dvH861/C2yckSiabTNjX5p4DttIq3Mu1xHHc8Wlj1XGHPUdnEjOp5G5ICtHxgGjnayS4vNCSBTKmvPA3o5bO3Zr6OYlQgQhQLUP8FKiX0XXUfSa8b2Bddvo9hAAAAIBCF+mDn5FVxfu5wtzf08IDLLdCZrUnF3K/80dPsKzYxq+P+VEr41HibQko5m6ROWuwDvR6afvvy/LfoduDhulMqBIMk6yD51Zvdx/uKUboEN+HcWFsJZu5dDQO70dO9IddA3QaHgO+bUBLNPnaWII1C8umaOq8W4v+JVN1p1hSAw== apache@ci.netvlies.net',
   		type => 'rsa',
   		user => 'deploy',
   		require => File["/home/deploy/.ssh"],
	}
	
	file { "/usr/sbin/netvlies":
		ensure => 'directory',
		owner => 'root',
		group => 'root',
		mode => 744
	}
	
	file { "/etc/profile.d/netvlies.sh":
		ensure => present,
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///modules/development/netvlies.sh"
	}
	file { "/usr/sbin/netvlies/update_dns.sh":
        ensure => present,
        owner => root,
        group => root,
        mode => 755,
        source => "puppet:///modules/development/update_dns.sh",
        require => File["/usr/sbin/netvlies"]
    }
    file { "/usr/sbin/netvlies/httpd_reload":
        ensure => present,
        owner => root,
        group => root,
        mode => 755,
        source => "puppet:///modules/development/httpd_reload",
        require => File["/usr/sbin/netvlies"]
    }
    file { "/etc/sudoers":
        ensure => file,
        owner => root,
        group => root,
        mode => 0440,
        source => "puppet:///modules/development/sudoers",
        require => File["/usr/sbin/netvlies"]
    }
    file {"/home/vagrant/vhosts":
        ensure      => directory,
        owner       => vagrant,
        group       => vagrant,
        mode        => 755
    }
    file {"/home/vagrant/logs":
        ensure      => directory,
        owner       => vagrant,
        group       => vagrant,
        mode        => 0777
    }
    file {"/home/vagrant":
        ensure      => directory,
        owner       => vagrant,
        group       => vagrant,
        mode        => 0755
    }
    file{ "/home/vagrant/xdebug":
        ensure      => directory,
        owner       => vagrant,
        group       => vagrant,
        mode        => 0777,
        require     => File["/home/vagrant"]
    }
    
    service { "iptables":
        ensure      => stopped,
        enable      => false,
        hasstatus   => true,
    }
    service { "ip6tables":
        ensure      => stopped,
        enable      => false,
        hasstatus   => true
    }
}
