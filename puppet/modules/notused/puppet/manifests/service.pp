class puppet::service {
    service { ["puppet"]:
        ensure      => stopped,
        hasstatus   => true,
        hasrestart  => true,
        enable      => false,
    }
}