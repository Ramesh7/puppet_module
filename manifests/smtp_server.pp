class puppet_module::smtp_server {

  # file { "C:\\CommandCenterInstaller\\WinSMTPServer" :
  #   ensure => directory,
  #   require => File["C:\\CommandCenterInstaller"],
  # }

  # file { "SMTP Installer" :
  #   path     => "C:\\CommandCenterInstaller\\WinSMTPServer\\WinSMTPServerRelease_0_90_01.zip",
  #   source   => "puppet:///modules/puppet_module/WinSMTPServerRelease_0_90_01.zip",
  #   owner    => "Administrators",
  #   group    => "Administrators",
  #   mode     => "0770", 
  #   ensure   => present,
  #   require  => File["C:\\CommandCenterInstaller\\WinSMTPServer"],
  # }

  # unzip { "Unzip SMTP setup":
  #   source  => "C:\\CommandCenterInstaller\\WinSMTPServer\\WinSMTPServerRelease_0_90_01.zip",
  #   creates => "C:\\CommandCenterInstaller\\WinSMTPServer\\WinSMTPServerRelease_0_90_01",
  #   require => File["SMTP Installer"],
  #   before => Package["SFTP install"],
  # }

  # Install SMTP Server windows feature
  exec { "SMTP Server" :
    command => 'Install-WindowsFeature -Name SMTP-Server',
    timeout => 1200,
    provider => powershell,
  }

  # exec { "SMTP Service" :
  #   command => 'Start-Service SMTPSVC',
  #   provider => powershell,
  #   before => Package["SMTP Server"]
  # }

  # exec { "Install .NET 3.5" :
  #   command => 'cmd /c dism /online /enable-feature /featurename:NetFX3 /all /Source:c:\\sources\\sxs /LimitAccess',
  #   provider => 'powershell',
  #   before => Package["SFTP install"],
  # }

  # package { "SFTP install" :
  #   ensure          => installed,
  #   source          => "C:\\CommandCenterInstaller\\WinSMTPServer\\setup.exe",
  #   install_options => ['/qn'],
  #   provider => windows,
  # }

  service { "SMTPSVC" :
    ensure => running,
    require => Exec["SMTP Server"]
  }

}
