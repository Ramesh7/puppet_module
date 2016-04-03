class puppet_module::curl {

  file { "Curl Installer" :
    path     => "C:\\CommandCenterInstaller\\curl.exe",
    source   => "puppet:///modules/puppet_module/curl.exe",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\CommandCenterInstallerss"],
  }

  package { "Curl install" :
    ensure          => installed,
    source          => "C:\\CommandCenterInstaller\\curl.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => File["Curl Installer"],
  }

}
