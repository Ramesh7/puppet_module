class puppet_module {
  include puppet_module::iis_server	
  include puppet_module::dot_net
}
