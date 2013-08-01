class samba::install {

	package { "samba" :
    	ensure => installed;
    }

    firewall { '137 open port 137':
        port   => [137, 138],
        proto  => udp,
        action => accept
    }

    firewall { '139 open port 139':
        port   => [139, 445],
        proto  => tcp,
        action => accept
    }

}

