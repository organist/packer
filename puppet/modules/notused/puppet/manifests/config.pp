class puppet::config {
    file { "/etc/puppet/puppet.conf" :
        ensure => file,
        source => "puppet:///modules/puppet/puppet.conf",
        owner => root,
        group => root
    }
}