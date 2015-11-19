class ntp{

package {'ntp':
        ensure  =>'installed',
}
file {'/etc/ntp.conf':
        ensure  =>'file',
        owner   =>'root',
        group   =>'root',
        mode    =>'644',
        content =>"server 192.168.1.30",
        require =>Package['ntp'],
        notify  =>Service['ntpd'],
}
file {'/etc/sysconfig/ntpd':
        ensure  =>'file',
        owner   =>'root',
        group   =>'root',
        mode    =>'644',
        source  =>'puppet:///modules/ntp/ntpd',
        require =>Package['ntp'],
        notify  =>Service['ntpd'],
}
service {'ntpd':
        ensure  =>'running',
        enable  =>'true',
        require =>Package['ntp'],
}
}
