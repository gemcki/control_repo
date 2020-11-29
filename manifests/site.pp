node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
  }
  file {'/root/helloworld.sh':
    ensure  => file,
    content => 'echo Hello World',
    mode    => '0144',
  }
  exec {'/root/helloworld.sh':}
}
