class puppet_module {
 
  file { "C:\\GTechConfigFiles" :
    ensure => directory,
  }

  include puppet_module::iis_server
  include puppet_module::dot_net
  include puppet_module::ie_browser
  include puppet_module::ntp_server
  include puppet_module::smtp_server
  include puppet_module::oracle_config
  include puppet_module::curl

}
