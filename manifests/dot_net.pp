class puppet_module::dot_net {

  file { "Dot Net Installer" :
    path     => "C:\GTechConfigFiles\dotNetFx45_Full_setup.exe",
    source   => "puppet:///modules/puppet_module/iisexpress_1_11_x86_en-US.msi",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    provider => windows,
    ensure   => present,
    require  => File["C:\GTechConfigFiles"],
  }

  package { "Dot Net" :
    ensure          => installed,
    source          => "C:\GTechConfigFiles\dotNetFx45_Full_setup.exe",
    install_options => ['/VERYSILENT'],
    require  => File["Dot Net Installer"],
  }

}
