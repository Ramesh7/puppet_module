class puppet_module::curl {

  file { "Curl Installer" :
    path     => "C:\\GTechConfigFiles\\curl_7_33_0_win64.zip",
    source   => "puppet:///modules/puppet_module/curl_7_33_0_win64.zip",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  unzip { "Unzip Curl setup":
    source  => "C:\\GTechConfigFiles\\curl_7_33_0_win64.zip",
    creates => "C:\\GTechConfigFiles\\curl_7_33_0_win64",
    require => File["Curl Installer"],
  }

  package { "Curl install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\curl_7_33_0_win64\\curl.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => Unzip["Unzip Curl setup"],
  }

}
