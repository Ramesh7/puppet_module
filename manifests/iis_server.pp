class puppet_module::iis_server{
 
  file {'C:\GTechConfigFiles':
    ensure => directory,
  }

  file {'IIS Installer':
    path     => 'C:\GTechConfigFiles\iisexpress_1_11_x86_en-US.msi',
    source   => "puppet:///modules/puppet_module/iisexpress_1_11_x86_en-US.msi",
    owner    => 'Administrators',
    group    => 'Administrators',
    mode     => 0770, 
    provider => windows,
    ensure   => present,
    require  => File['C:\GTechConfigFiles'],
  }

  package { "IIS 7.5 Express":
    ensure          => installed,
    source          => 'C:\GTechConfigFiles\iisexpress_1_11_x86_en-US.msi',
    install_options => ['/qn'],
    provider => windows,
    require  => File['IIS Installer'],
  }

}
