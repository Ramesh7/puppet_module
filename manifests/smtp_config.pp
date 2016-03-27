class puppet_module::smtp_config {

  file { "SMTP Installer" :
    path     => "C:\\GTechConfigFiles\\WinSMTPServerRelease_0_90_01.zip",
    source   => "puppet:///modules/puppet_module/WinSMTPServerRelease_0_90_01.zip",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  unzip { "Unzip SMTP setup":
    source  => "C:\\GTechConfigFiles\\WinSMTPServerRelease_0_90_01.zip",
    creates => "C:\\GTechConfigFiles\\WinSMTPServerRelease_0_90_01\\",
    require => File["SMTP Installer"],
  }

  package { "SFTP install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\WinSMTPServerRelease_0_90_01\\setup.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => Unzip["Unzip SMTP setup"],
  }

}
