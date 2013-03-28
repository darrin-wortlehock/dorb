module DORB
  class Droplet

    include Resource

    self.singular_resource_name = 'droplet'
    self.collection_resource_name = 'droplets'

    define_attribute :image_id
    define_attribute :size_id
    define_attribute :backups_active
    define_attribute :region_id
    define_attribute :status

  end
end
