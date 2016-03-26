class puppet_module::ntp_server {

  file { "NTP Installer" :
    path     => "C:\\GTechConfigFiles\\ntp-4.2.8p5-win32-setup.exe",
    source   => "puppet:///modules/puppet_module/ntp-4.2.8p5-win32-setup.exe",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\GTechConfigFiles"],
  }

  exec{ "NTP Server install" :
    command  => 'cmd /c "C:\\GTechConfigFiles\\ntp-4.2.8p5-win32-setup.exe" /q /norestart /S',
    timeout  => 1800,
    provider => powershell,
    require  => File["NTP Installer"],
  }

  # package { "NTP Server install" :
  #   ensure          => installed,
  #   source          => "C:\\GTechConfigFiles\\ntp-4.2.8p5-win32-setup.exe",
  #   install_options => ['/qn', '/VERYSILENT',
  #     { '/l' => 'Program Files\\NTP\\ntp.log' },
  #     { 'INSTALLLOCATION' => 'C:\\Program Files\\NTP' },
  #   ],
  #   provider => windows,
  #   require  => File["NTP Installer"],
  # }

}
