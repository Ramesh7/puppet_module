class iis_server{
 
  # install iis server
  package { "IIS 7.5 Express":
    ensure          => installed,
    source          => puppet:///modules/dotnet1/iisexpress_1_11_x86_en-US.msi,
    install_options => ['/qn'],
    provider => windows,
  }

}
