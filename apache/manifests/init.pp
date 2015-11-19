class apache{
package{'httpd':
        ensure  =>'installed',
}
file{'/var/www/html/index.html':
        ensure  =>'file',
        owner   =>'root',
        group   =>'root',
        mode    =>'644',
        source  =>'puppet:///modules/apache/index.html',
        require =>Package['httpd'],
}
file{'/etc/httpd/conf.d/sample.conf':
        ensure  =>'file',
        owner   =>'root',
        group   =>'root',
        mode    =>'644',
        source  =>'puppet:///modules/apache/sample.conf',
        notify  =>Service['httpd'],
        require =>Package['httpd'],
}
service{'httpd':
        ensure  =>'running',
        enable  =>'true',
        require =>Package['httpd'],
}
}
