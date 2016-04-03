class puppet_module::dot_net {

  file { "C:\\CommandCenterInstaller\\dotNet" :
    ensure => directory,
    require  => File["C:\\CommandCenterInstaller"],
  }

  file { "Dot Net Installer" :
    path     => "C:\\CommandCenterInstaller\\dotNet\\dotNetFx45_Full_setup.exe",
    source   => "puppet:///modules/puppet_module/dotNetFx45_Full_setup.exe",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\CommandCenterInstaller\\dotNet"],
  }

  exec { "Enable ASP.NET 4.5" :
    command => 'Install-WindowsFeature -Name Web-Asp-Net45',
    provider => powershell.
    before => Exec["Dot Net"],
  }

  exec { "Dot Net" :
    command  => 'cmd /c "C:\\CommandCenterInstaller\\dotNet\\dotNetFx45_Full_setup.exe" /q /norestart',
    # creates  => "C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\MSBuild\\Microsoft.Build.Core.xsd",
    timeout  => 1800,
    provider => powershell,
    require  => File["Dot Net Installer"],
  }

  file { "C:\\CommandCenterInstaller\\ASPAjax" :
    ensure => directory,
    require  => File["C:\\CommandCenterInstaller"],
  }

  file { "ASP Ajax Installer File" :
    path     => "C:\\CommandCenterInstaller\\ASPAjax\\ASPAJAXSourceCode.msi",
    source   => "puppet:///modules/puppet_module/ASPAJAXSourceCode.msi",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\CommandCenterInstaller\\ASPAjax"],
  }

  package { "ASP Ajax Installer" :
    ensure          => installed,
    source          => "C:\\CommandCenterInstaller\\ASPAjax\\ASPAJAXSourceCode.msi",
    install_options => ['/qn'],
    provider => windows,
    require  => File["ASP Ajax Installer File"],
  } 

}
