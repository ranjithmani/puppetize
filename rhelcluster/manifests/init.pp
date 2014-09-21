#This class is to create a RedHat cluster suite 
#created on 15-Aug-2014
#created by Ranjith Mani
#please feel free to modify this class so that it looks so meaningful and effective.
class rhelcluster{
file {'/etc/hosts':
	ensure	=>'file',
	owner	=>'root',
	group	=>'root',
	mode	=>'0644',
	source	=>"$puppet://modules/rhelcluster/etc/hosts",
	}
file {'/etc/yum.repos.d/local.repo':
	ensure	=>'file',
	owner	=>'root',
	group	=>'root'
	mode	=>'0644',
	source	=>"$puppet://modules/rhelcluster/local.repo"
	}
file {'/etc/selinux/config':
	ensure	=>'file',
	source	=>"$puppet://modules/rhelcluster/selinux/config",
	}
service {'iptables':
	ensure	=>'stop',
	enabled	=>'false',
	}
yumgroup {'High Availabilty':
	ensure	=>'installed',
	}
file {'/etc/cluster/cluster.conf':
	ensure	=>'file':
	owner	=>'root',
	group	=>'root',
	mode	=>'0644',
	source	=>"$puppet://modules/rhelcluster/cluster.conf",
	require	=>Yumgroup['High Availability'],
	notify	=>Service['cman'],
	}
service {'cman':
	ensure		=>'running',
	enabled	=>'true',
	hastatus	=>'true',
	harestart	=>'true',
	require		=>Yumgroup['High Availability'],
	require		=>File[/etc/cluster/cluster.conf'],
	}
}
