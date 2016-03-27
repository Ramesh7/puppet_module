class puppet_module::smtp_server {

  file { "C:\\GTechConfigFiles\\WinSMTPServer" :
    ensure => directory,
    require => File["C:\\GTechConfigFiles"],
  }

  file { "SMTP Installer" :
    path     => "C:\\GTechConfigFiles\\WinSMTPServer\\WinSMTPServerRelease_0_90_01.zip",
    source   => "puppet:///modules/puppet_module/WinSMTPServerRelease_0_90_01.zip",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles\\WinSMTPServer"],
  }

  unzip { "Unzip SMTP setup":
    source  => "C:\\GTechConfigFiles\\WinSMTPServer\\WinSMTPServerRelease_0_90_01.zip",
    creates => "C:\\GTechConfigFiles\\WinSMTPServer",
    require => File["SMTP Installer"],
    before => Package["SFTP install"],
  }

  package { "SFTP install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\WinSMTPServer\\setup.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => Unzip["Unzip SMTP setup"],
  }
  
  Unzip["Unzip SMTP setup"] ~> Package["SFTP install"]
}
