class puppet_module {
 
  file { "C:\\CommandCenterInstaller" :
    ensure => directory,
  }

  include puppet_module::iis_server
  include puppet_module::dot_net
  # include puppet_module::ie_browser
  include puppet_module::ntp_server
  include puppet_module::smtp_server
  include puppet_module::msmq
  include puppet_module::odac_client
  include puppet_module::oracle_client
  include puppet_module::oracle_db_server

}
