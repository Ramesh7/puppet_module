class puppet_module::msmq {

  exec { "Windows MSMQ Feature Install" :
    command => 'Get-WindowsFeature -Name MSMQ* | Install-WindowsFeature',
    timeout => 1200,
    provider => powershell
  }

  # exec { "MSMQ Enable" :
  #   command => 'Enable-WindowsOptionalFeature -Online -FeatureName MSMQ -All',
  #   timeout => 1200,
  #   provider => powershell
  # }

  # exec { "MSMQ Services Enable" :
  #   command => 'Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Services -All',
  #   timeout => 1200,
  #   provider => powershell
  # }

  # exec { "MSMQ Server Enable" :
  #   command => 'Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Server -All',
  #   timeout => 1200,
  #   provider => powershell
  # }    

  service { "MSMQ" :
    ensure  => running,
    require => Exec["Windows MSMQ Feature Install"]
  }

}
