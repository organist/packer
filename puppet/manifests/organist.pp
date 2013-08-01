
node 'organist' {

    stage { 'first':
        before => Stage['main'],
    }

    class { 'system':
        stage => first,
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

    firewall { '80 open port 80':
        port   => [80, 443  ],
        proto  => tcp,
        action => accept
    }

    # This may come in handy during development, not required for organist to function
    class { 'samba': }

    # Netvlies specific config
    class { 'netvlies': }

}
