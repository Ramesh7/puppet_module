class puppet_module::ntp_server {

  file { "NTP Installer" :
    path     => "C:\\GTechConfigFiles\\ntp-4.2.8p5-win32-setup.exe",
    source   => "puppet:///modules/puppet_module/ntp-4.2.8p5-win32-setup.exe",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  package { "NTP Server install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\ntp-4.2.8p5-win32-setup.exe",
    install_options => ['/qn'],
    provider => windows,
    require  => File["NTP Installer"],
  }

}