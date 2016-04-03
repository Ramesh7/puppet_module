class puppet_module::oracle_db_server {

  file { "C:\\CommandCenterInstaller\\OracleDBServer" :
    ensure => directory,
    require  => File["C:\\CommandCenterInstaller"],
  }

  file { "Copy oracle_db_Server resp" :
    path     => "C:\\CommandCenterInstaller\\OracleDBServer\\OracleDBResponseFile.rsp",
    source   => "puppet:///modules/puppet_module/OracleDBResponseFile.rsp",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\CommandCenterInstaller\\OracleDBServer"],
    before  => Exec["Install Oracle DB Server"]
  }
     
   exec { 'Install Oracle DB Server':
     command   => '  
       PUSHD C:\\CommandCenterInstaller\\OracleDBServer\\win64_11gR2_database_1of2\\database
       cmd /c setup.exe -silent -nowait -noconfig -responseFile "C:\\CommandCenterInstaller\\OracleDBServer\\OracleDBResponseFile.rsp" 
       Start-Sleep 700
      ',
       creates => 'C:\\Oracle\\product\\12.1.0\\client_1\\network\\admin\\tnsnames.ora',
       timeout => 1200,
       provider => powershell
   }  

}