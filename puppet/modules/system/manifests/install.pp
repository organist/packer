class system::install {

	package {
		[
    		"mlocate",
    		"libmcrypt",
    		"git",
		] :
		ensure => latest,
		require => Yumrepo['EPEL']
	}
}
