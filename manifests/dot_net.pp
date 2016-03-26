class puppet_module::dot_net {

  file { "Dot Net Installer" :
    path     => "C:\\GTechConfigFiles\\dotNetFx45_Full_setup.exe",
    source   => "puppet:///modules/puppet_module/dotNetFx45_Full_setup.exe",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  exec{ "Dot Net" :
    command  => 'cmd /c "C:\\GTechConfigFiles\\dotNetFx45_Full_setup.exe" /q /norestart',
    # creates  => "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\MSBuild\\Microsoft.Build.Core.xsd",
    timeout  => 1800,
    provider => powershell,
    require  => File["Dot Net Installer"],
  }

  file { "ASP Ajax Installer File" :
    path     => "C:\\GTechConfigFiles\\ASPAJAXSourceCode.msi",
    source   => "puppet:///modules/puppet_module/ASPAJAXSourceCode.msi",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  package { "ASP Ajax Installer" :
    ensure          => installed,
    source          => "C:\\GTechConfigFiles\\ASPAJAXSourceCode.msi",
    install_options => ['/qn'],
    provider => windows,
    require  => File["ASP Ajax Installer File"],
  } 

}
