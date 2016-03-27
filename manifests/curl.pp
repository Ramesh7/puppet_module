class puppet_module::curl {

  file { "Curl Installer" :
    path     => "C:\\GTechConfigFiles\\curl-7.33.0-win64-nossl.zip",
    source   => "puppet:///modules/puppet_module/curl-7.33.0-win64-nossl.zip",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  unzip { "Unzip Curl setup":
    source  => "C:\\GTechConfigFiles\\curl-7.33.0-win64-nossl.zip",
    creates => "C:\\GTechConfigFiles\\curl-7.33.0-win64-nossl",
    require => File["Curl Installer"],
  }

  package { "Curl install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\curl-7.33.0-win64-nossl\\curl.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => Unzip["Unzip Curl setup"],
  }

}
