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

#  package { "Dot Net" :
#    ensure          => installed,
#    source          => "C:\GTechConfigFiles\dotNetFx45_Full_setup.exe",
#    install_options => ['/S'],
#    require  => File["Dot Net Installer"],
#  }

  exec{ "Dot Net" :
    command  => '${Sys32}\\cmd.exe /c "C:\GTechConfigFiles\dotNetFx45_Full_setup.exe" /q /norestart | exit 0',
    creates  => "C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild\Microsoft.Build.Core.xsd",
    timeout  => 1800,
    provider => powershell,
    require  => package["Dot Net Installer"],
  }

}
