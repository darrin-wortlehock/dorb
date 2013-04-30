module DORB
  class Droplet

    include Resource

    self.singular_resource_name = 'droplet'
    self.collection_resource_name = 'droplets'

    define_attribute :image_id
    define_attribute :size_id
    define_attribute :backups_active
    define_attribute :region_id
    define_attribute :ip_address
    define_attribute :status

    def self.find_by_ip_address(ip_address)
      droplet = all.find { |d| d.ip_address == ip_address }
      raise APIError if droplet.nil?
      droplet
    end

  end
end
