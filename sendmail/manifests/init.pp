class sendmail{

package {'sendmail':
        ensure  =>'installed',
}

package {'sendmail-cf':
        ensure  =>'installed',
}

package {'mailx':
        ensure  =>'installed',
}

file {'/etc/mail/sendmail.cf':
        ensure  =>'file',
        owner   =>'root',
        group   =>'root',
        mode    =>'644',
        source  =>'puppet:///modules/sendmail/sendmail.cf',
        require =>Package['sendmail'],
        notify  =>Service['sendmail'],
}

service {'sendmail':
        ensure  =>'running',
        enable  =>'true',
        require =>Package['sendmail'],
}
}
