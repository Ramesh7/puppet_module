class puppet_module::oracle_config {
  
  include puppet_module::curl

  $s3_bucket_name = "windows-command-center"
  $odac_file_name = "ODAC121024_x64.zip"
  $oracle_client = "win64_11gR2_client.zip"

  file { "ODAC Installer" :
    path     => "C:\\GTechConfigFiles\\curl-7.48.0.zip",
    source   => "puppet:///modules/puppet_module/curl-7.48.0.zip",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  unzip { "example":
    source  => "C:\\GTechConfigFiles\\curl-7.48.0.zip",
    creates => "C:\\GTechConfigFiles\\curl-7.48.0",
  }

  file { "ODAC Installer" :
    path     => "C:\\GTechConfigFiles\\curl-7.48.0.zip",
    source   => "puppet:///modules/puppet_module/curl-7.48.0.zip",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  unzip { "example":
    source  => "C:\\GTechConfigFiles\\curl-7.48.0.zip",
    creates => "C:\\GTechConfigFiles\\curl-7.48.0",
  }

}
