class samba::config {

	file { "smbconf":
		path => "/etc/samba/smb.conf",
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///modules/samba/smb.conf",
		require => Class["samba::install"],
		notify => Class["samba::service"]
	}

	file { "add_smb_user":
		path =>  "/usr/local/bin/add_smb_user.sh",
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0744,
		source => "puppet:///modules/samba/smb.sh",
		require => Class["samba::install"],
		notify => Class["samba::service"]
	}

	exec { '/usr/local/bin/add_smb_user.sh': require => File[add_smb_user] }
}
