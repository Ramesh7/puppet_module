class puppet_module::curl {

  file { "Curl Installer" :
    path     => "C:\\GTechConfigFiles\\curl.exe",
    source   => "puppet:///modules/puppet_module/curl.exe",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  package {"MSVCR110.dll":
   ensure => installed,
   source => "c:\\GTechConfigFiles\\MSVCR110.dll",
   
  }

  package { "Curl install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\curl.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => Unzip["Curl Installer"],
  }

}
