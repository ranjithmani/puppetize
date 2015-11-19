class motd {
file { '/etc/motd':
        ensure  =>'file',
        mode    =>'644',
        owner   =>'root',
        group   =>'root',
        source  =>'puppet:///modules/motd/motd',
}
}
