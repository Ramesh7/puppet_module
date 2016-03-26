class puppet_module {
 
  file { "C:\\GTechConfigFiles" :
    ensure => directory,
  }

  include puppet_module::iis_server	
  include puppet_module::dot_net
}
