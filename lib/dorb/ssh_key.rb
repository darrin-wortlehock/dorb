module DORB
  class SSHKey

    include Resource

    self.collection_resource_name = 'ssh_keys'
    self.singular_resource_name = 'ssh_key'
    
    define_attribute :ssh_key_pub

  end
end
