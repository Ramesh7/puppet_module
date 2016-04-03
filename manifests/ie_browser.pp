class puppet_module::ie_browser {

  file { "IE Installer" :
    path     => "C:\\CommandCenterInstaller\\EIE11_EN-US_MCM_WIN764.exe",
    source   => "puppet:///modules/puppet_module/EIE11_EN-US_MCM_WIN764.exe",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\CommandCenterInstaller"],
  }

  package { "IE Browser install" :
    ensure          => installed,
    source          => "C:\\CommandCenterInstaller\\EIE11_EN-US_MCM_WIN764.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => File["IE Installer"],
  }

}
