class puppet_module::msmq{
	
	exec { "MSMQ Enable" :
       command => 'Enable-WindowsOptionalFeature -Online -FeatureName MSMQ -All',
       timeout => 1200,
       provider => powershell
     }

     exec { "MSMQ Services Enable" :
       command => 'Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Services -All',
       timeout => 1200,
       provider => powershell
     }

     exec { "MSMQ Server Enable" :
       command => 'Enable-WindowsOptionalFeature -Online -FeatureName MSMQ-Server -All',
       timeout => 1200,
       provider => powershell
     }    

     service { "MSMQ" :
       ensure  => running,
       require => [ Exec["MSMQ Enable"], Exec["MSMQ Services Enable"], Exec["MSMQ Server Enable"] ]   
     }
}