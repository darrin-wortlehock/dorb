module DORB
  class Image

    include Resource

    self.collection_resource_name = 'images'
    self.singular_resource_name = 'image'
    
    define_attribute :distribution

  end
end
