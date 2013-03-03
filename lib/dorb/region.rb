require 'json'
require 'rest_client'

module DORB
  class Region

    attr_accessor :id, :name
    
    def self.all
      @regions ||= begin
        response = RestClient.get url, :params => credentials
        raise "BANG" unless response.code == 200
        parsed_response = ::JSON.parse(response.to_str)
        raise "BANG BANG" unless parsed_response['status'] == 'OK'
        regions_attributes = parsed_response['regions']
        regions = {}
        regions_attributes.each do |region_attributes|
          region = Region.new(region_attributes.symbolize_keys)
          regions[region.to_sym] = region
        end
        regions
      end
    end

    def initialize( opts={} )
      options = opts.symbolize_keys
      required = Hash.new { |h,k| raise( "Attribute #{k.inspect} is required" ) }
      required.update(options)
      self.id = required[:id]
      self.name = required[:name]
    end

    def to_sym
      name.gsub(/\s/, '_').downcase.to_sym
    end
    
    private

    def self.url
      "#{DORB::API_ENDPOINT}/regions"
    end

    def self.credentials
      {:client_id => DORB::Config.client_id, :api_key => DORB::Config.api_key}
    end

  end
end
