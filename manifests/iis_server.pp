class puppet_module::iis_server{
 
  # install iis server
  package { "IIS 7.5 Express":
    ensure          => installed,
    source          => puppet:///modules/puppet_module/iisexpress_1_11_x86_en-US.msi,
    install_options => ['/qn'],
    provider => windows,
  }

}
