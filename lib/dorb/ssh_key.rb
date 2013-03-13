module DORB
  class SSHKey

    include Resource

    self.collection_resource_name = 'ssh_keys'
    self.singular_resource_name = 'ssh_key'

  end
end
