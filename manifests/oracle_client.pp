class puppet_module::oracle_client {

  file { "C:\\CommandCenterInstaller\\OracleClient" :
    ensure => directory,
    require  => File["C:\\CommandCenterInstaller"],
  }

  file { "Copy oracle_client resp" :
    path     => "C:\\CommandCenterInstaller\\OracleClient\\OracleClientResponseFile.rsp",
    source   => "puppet:///modules/puppet_module/OracleClientResponseFile.rsp",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\CommandCenterInstaller\\OracleClient"],
    before  => Exec["Install Oracle Client"]
  }
     
   exec { 'Install Oracle Client':
     command   => '  
       PUSHD C:\\CommandCenterInstaller\\OracleClient
       cmd /c setup.exe -silent -nowait -noconfig -responseFile "C:\\CommandCenterInstaller\\OracleClient\\OracleClientResponseFile.rsp" 
       Start-Sleep 700
       }
      ',
       creates => 'C:\\Oracle\\product\\12.1.0\\client_1\\network\\admin\\tnsnames.ora',
       timeout => 1200,
       provider => powershell
   }  

}