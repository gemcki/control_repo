class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1+vhVEvKszCH2HZe9H2NJbMyt2g5dPIcY0jl7lsZ6N8EGkYIQH8bUgNEvEPpPFfwrd28OmudoW3kfg6eqUDTFwvX5ZBe876s8vr29zBS2GLILrmes8m+mB6+4KFS8guTMt7qD1ajGHm3k/wNsaYYqaCyfhdkvhMsopdq+LQEBbMSrUryOlYh0iT4XLt8ohhILXCJHj6TIUqyHDLS8Pi+TZchNyJvBmadlnd7OY4JzRi/K7yJ99aNbsE4C4C294hvzaoKxjtv3lklS9ZrveVFm15tXVxtE0d613woRGklMVRdlvlxWnrHcEMIRdje0otZ7xKvqKZScvi/h3k1Xs6k5',
	}  
}
