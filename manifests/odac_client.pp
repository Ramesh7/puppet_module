class puppet_module::odac_client {
	
   file { "Copy odac_client resp" :
    path     => "C:\\odac_oracle_client\\odac_client.rsp",
    source   => "puppet:///modules/puppet_module/odac_client.rsp",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    before  => exec["InstallOdac"],
  }
     
   exec { 'InstallOdac':
     command   => '  
       PUSHD C:\\odac_oracle_client\\
       cmd /c setup.exe -silent -nowait -noconfig -responseFile "C:\\odac_oracle_client\\odac_client.rsp" 
       Start-Sleep 700
       }
      ',
       creates => 'C:\\Oracle\\product\\12.1.0\\client_1\\network\\admin\\tnsnames.ora',
       timeout => 1200,
       provider => powershell
   }  

}