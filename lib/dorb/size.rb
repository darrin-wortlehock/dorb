require 'json'
require 'rest_client'

module DORB
  class Size

    attr_accessor :id, :name, :memory, :disk, :cpu, :cost_per_hour

    def initialize( opts={} )
      options = opts.symbolize_keys
      required = Hash.new { |h,k| raise( "Attribute #{k.inspect} is required" ) }
      required.update(options)
      self.id = required[:id]
      self.name = required[:name]
      self.memory = options[:memory]
      self.disk = options[:disk]
      self.cpu = options[:cpu]
      self.cost_per_hour = options[:cost_per_hour]
    end

    def to_sym
      name.gsub(/\s/, '_').downcase.to_sym
    end

    def self.all
      @sizes ||= begin
        response = RestClient.get url, :params => credentials
        raise APIError.new("Failed to get #{url}. Response code was #{response.code}") unless response.code == 200
        parsed_response = ::JSON.parse(response.to_str)
        raise APIError.new("Failed to get #{url}. Parsed response status was #{parsed_response['status']}") unless parsed_response['status'] == 'OK'
        sizes_attributes = parsed_response['sizes']
        sizes = {}
        sizes_attributes.each do |size_attributes|
          size = Size.new(size_attributes.symbolize_keys)
          sizes[size.to_sym] = size
        end
        sizes
      end
    end

    def memory
      @memory ||= extended_attributes[:memory]
    end

    def disk
      @disk ||= extended_attributes[:disk]
    end

    def cpu
      @cpu ||= extended_attributes[:cpu]
    end
   
    def cost_per_hour
      @cost_per_hour ||= extended_attributes[:cost_per_hour]
    end

    private
    
    def extended_attributes
      @extended_attributes ||= begin
        response = RestClient.get "#{url}/#{id}", :params => credentials
        raise APIError.new("Failed to get #{url}/#{id}. Response code was #{response.code}") unless response.code == 200
        parsed_response = ::JSON.parse(response.to_str)
        raise APIError.new("Failed to get #{url}. Parsed response status was #{parsed_response['status']}") unless parsed_response['status'] == 'OK'
        parsed_response['size'].symbolize_keys
      end
    end

    def self.url
      "#{DORB::API_ENDPOINT}/sizes"
    end

    def self.credentials
      {:client_id => DORB::Config.client_id, :api_key => DORB::Config.api_key}
    end

  end
end
