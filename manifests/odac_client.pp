class puppet_module::odac_client {

  file { "C:\\CommandCenterInstaller\\ODACClient" :
    ensure => directory,
    require  => File["C:\\CommandCenterInstaller"],
  }

  file { "Copy odac_client resp" :
    path     => "C:\\CommandCenterInstaller\\ODACClient\\ODACClientResponseFile.rsp",
    source   => "puppet:///modules/puppet_module/ODACClientResponseFile.rsp",
    owner    => "Administrators",
    group    => "Administrators",
    mode     => "0770", 
    ensure   => present,
    require  => File["C:\\CommandCenterInstaller\\ODACClient"],
    before  => exec["Install ODAC"],
  }

   exec { 'Install ODAC':
     command   => '  
       PUSHD C:\\CommandCenterInstaller\\ODACClient\\
       cmd /c setup.exe -silent -nowait -noconfig -responseFile "C:\\CommandCenterInstaller\\ODACClient\\ODACClientResponseFile.rsp" 
       Start-Sleep 700
       }
      ',
       creates => 'C:\\Oracle\\product\\12.1.0\\client_1\\network\\admin\\tnsnames.ora',
       timeout => 1200,
       provider => powershell
   }  

}
