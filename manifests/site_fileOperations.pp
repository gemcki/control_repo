node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
  }
  file {'/root/helloworld.sh':
    ensure  => file,
    content => "#!/bin/bash\necho Hello World",
    mode    => '0755',
  }
  file {'/root/showip.sh':
    ensure  => file,
    content => "#!/bin/bash\nifconfig",
    mode    => '0755',
  }
  exec {'/root/ifconfig.sh':
    user => 'root',
    command => '/root/ifconfig.sh',
    refreshonly => true,
  }
}
