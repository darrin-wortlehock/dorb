module DORB
  class Size

    include Resource

    self.singular_resource_name = 'size'
    self.collection_resource_name = 'sizes'
    self.extended_attributes = 'true'
    
    define_attribute :memory
    define_attribute :disk
    define_attribute :cpu
    define_attribute :cost_per_hour

  end
end
