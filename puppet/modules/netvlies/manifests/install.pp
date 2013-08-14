class netvlies::install {

    # for backwards compatibility with older capifony scripts
	exec { 'sudo gem install capifony --version "=2.1.5"':
	     path   => "/usr/bin:/usr/sbin:/bin",
	     creates => "/usr/lib/ruby/gems/1.8/specifications/capifony-2.1.5.gemspec"
	}

}
