class anyterm::install {

	package {
		[
            "subversion",
            "gcc-c++",
            "boost-devel",
            "zlib-devel",
            "patch"
	    ] :
		ensure => latest
	}

    exec { "/home/vagrant/src/anyterm/build.sh":
        provider => shell,
        path => "/usr/bin:/usr/sbin:/bin",
        creates => "/usr/sbin/anytermd",
        require => Package["subversion","gcc-c++", "boost-devel", "zlib-devel", "patch"]
    }

}
