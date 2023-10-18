class minecraft (
  $url = 'https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar',
  $install_dir = '/opt/minecraft',
){
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.1.20.2.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'msopenjdk-21':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir,
    })
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['msopenjdk-21'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
