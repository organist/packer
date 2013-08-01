class puppet::install {
    package { "puppet":
        ensure  => latest,
        require => Class["puppet::service"]
    }
}