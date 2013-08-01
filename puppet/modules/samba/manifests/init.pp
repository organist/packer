class samba {
	include samba::params
	include samba::install, samba::config, samba::service
}
