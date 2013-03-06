module DORB
  class Size

    include Resource

    self.resource_name = 'size'
    
    define_attribute :memory
    define_attribute :disk
    define_attribute :cpu
    define_attribute :cost_per_hour

  end
end
