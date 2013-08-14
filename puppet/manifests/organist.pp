
node 'organist' {

    stage { 'setup-repos':
        before => Stage['main'],
    }

    class { 'system':
        stage => setup-repos,
    }

    class { 'ntp':
        servers    => [
            '0.europe.pool.ntp.org',
            '1.europe.pool.ntp.org',
            '2.europe.pool.ntp.org',
            '3.europe.pool.ntp.org'
        ]
    }

    class { 'php':  }

    class { 'mysql':  }

    class { 'mysql::server':
        config_hash => { 'root_password' => 'vagrant' }
    }

    mysql::db { 'vagrant':
        user     => 'vagrant',
        password => 'vagrant',
        host     => 'localhost',
        grant    => ['all'],
    }

    class { 'anyterm':  }

    class { 'nginx':  }

    class { 'organist':
        require => Class['nginx']
    }

    class { 'netvlies':  }

    firewall { '80 open port 80':
        port   => [80, 443  ],
        proto  => tcp,
        action => accept
    }

    # Not required for Organist, but can be quite usefull
    class { 'samba': }

}
