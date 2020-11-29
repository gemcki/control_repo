node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
  }
  file {'/root/helloworld.sh':
    ensure  => file,
    content => "#!/bin/bash\necho Hello World",
    mode    => '0144',
  }
  exec {'/root/helloworld.sh':
    user => 'root',
    command => '/root/helloworld.sh',
    refreshonly => true,
  }
}
