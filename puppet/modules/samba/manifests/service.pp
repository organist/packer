class samba::service {

	service { "smb":
        enable => true,
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        require => Package["samba"]
	}

}
