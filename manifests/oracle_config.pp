class puppet_module::oracle_config {

  include 's3file::curl'

  $s3_bucket_name = "windows-command-center"
  $odac_file_name = "ODAC121024_x64.zip"
  $oracle_client = "win64_11gR2_client.zip"

  windows_env { "AWS_ACCESS_KEY_ID" :
    ensure    => present,
    value => 'AKIAJFKXLTF4RAPLSBXA',
    user  => 'Administrator',
  }

  windows_env { "AWS_SECRET_ACCESS_KEY" :
    ensure    => present,
    value => 'wXpa/v5geZVGXdDTULysW0ddoD7fuRf3/ql0oHEu',
    user  => 'Administrator',
  }

  file { "C:\\GTechConfigFiles\\ODAC" :
    ensure => directory,
    require => File["C:\\GTechConfigFiles"],
  }

  s3file { "C:\\GTechConfigFiles\\ODAC\\$odac_file_name" :
    source => "$s3_bucket_name/$odac_file_name",
    ensure => 'latest',
    require => [ File["C:\\GTechConfigFiles\\ODAC"], WindowEnv["AWS_ACCESS_KEY_ID"], WindowsEnv["AWS_SECRET_ACCESS_KEY"] ]
  }

  unzip { "ODAC setup unzip":
    source  => "C:\\GTechConfigFiles\\ODAC\\$odac_file_name",
    creates => "C:\\GTechConfigFiles\\ODAC\\",
    require => S3file["C:\\GTechConfigFiles\\ODAC\\$odac_file_name"],
    before => Package["ODAC install"],
  }

  package { "ODAC install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\ODAC\\Setup.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => File["ODAC setup unzip"],
  }

  file { "C:\\GTechConfigFiles\\OracleClient" :
    ensure => directory,
    require => File["C:\\GTechConfigFiles"],
  }

  s3file { "C:\\GTechConfigFiles\\OracleClient\\$oracle_client" :
    source => "$s3_bucket_name/$oracle_client",
    ensure => 'latest',
    require => [ File["C:\\GTechConfigFiles\\OracleClient"], WindowEnv["AWS_ACCESS_KEY_ID"], WindowsEnv["AWS_SECRET_ACCESS_KEY"] ]
  }

  unzip { "Oracle setup unzip":
    source  => "C:\\GTechConfigFiles\\OracleClient\\$oracle_client",
    creates => "C:\\GTechConfigFiles\\OracleClient\\",
    require => S3file["C:\\GTechConfigFiles\\OracleClient\\$oracle_client"],
    before => Package["Oracle Client install"],
  }

  package { "Oracle Client install" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\OracleClient\\Setup.exe",
    install_options => ['/qn', '/VERYSILENT'],
    provider => windows,
    require  => File["Oracle setup unzip"],
  }

}
