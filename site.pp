node 'primary' {
include motd
include ntp
include apache
include samba
mount { 'media':
        ensure  =>'present',
        name    =>'/media',
        atboot  =>'yes',
        device  =>'/dev/sr0',
        fstype  =>'iso9660',
        options =>'ro',
}
include bashpp
}
node 'bind','slave','slave2' {
include motd
include bashpp
}
node 'linuxha1', 'linuxha2' {
include motd
include bashpp
}
##For data node configuration##
node 'datanode1', 'datanode2', 'datanode3', 'datanode4', 'datanode5', 'datanode6' {
include motd-hadoop
include bashpp
include sendmail
file {'/etc/yum.repos.d/local.repo.bak':
        ensure  =>'absent',
}
}
node 'namenode'{
include bashpp
}
node 'secnamenode'{
include bashpp
}
node 'storage' {
}
node 'master', 'co-master', 'worker1', 'worker2', 'worker3' {
include bashpp
include ntp
include motd
}
node 'puppet' {
include bashpp
}
node 'mail' {
include motd
include bashpp
include ntp
}
