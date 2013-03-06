require 'json'
require 'rest_client'

module DORB
  module Resource

    def self.included klass
      klass.extend ClassMethods
    end

    module ClassMethods

      attr_accessor :resource_name
      attr_accessor :attribute_names
      attr_accessor :extended_attributes
      alias :extended_attributes? :extended_attributes

      def define_attribute names
        [names].flatten.each do |name|
          #self.attribute_names = [self.attribute_names].flatten.compact << name
          attr_accessor(name)
        end
      end

      def all(options={})
        all_attributes = index(options)
        all_attributes.map do |attributes|
          if self.extended_attributes?
            find(attributes['id'])
          else
            new(attributes)
          end
        end
      end

      def find(id, options={})
        api_response = show(id, options)
        new(api_response)
      end

      private

      def index(options={}) 
        call_api
      end

      def show(id, options={})
        call_api(self.id)
      end

      def create(params={})
        raise NotImplementedError
      end

      def update(params={})
        raise NotImplementedError
      end

      def delete(params={})
        raise NotImplementedError
      end

      def call_api(action=nil, extra_params={})
        url = url_for_action(action)
        params = extra_params.merge(credentials)
        response = RestClient.get url, :params => params do |response, request, result, &block|
          raise APIError.new(api_call_error_message(request,response)) unless response.code < 400
          response.return!(request, result, &block)
        end
        parse_api_response(response)
      end

      def api_call_error_message(request, response)
        "API Call to #{request.method} #{request.url} failed. Response was #{response.description}"
      end

      def url_for_action(action=nil)
        uri = URI.parse(DORB::API_ENDPOINT)
        uri.path << "/#{self.resource_name}"
        uri.path << "/#{action}" unless action.nil?
        uri.path.gsub!(/\/\/+/, '/')
        uri.to_s
      end
      
      def credentials
        { :client_id => DORB::Config.client_id, :api_key => DORB::Config.api_key }
      end

      def parse_api_response(response)
        parsed_response = JSON.parse(response.to_str)
        unless parsed_response['status'] == 'OK'
          raise APIError.new("API call failed. Parsed response status was #{parsed_response['status']}") 
        end
        parsed_response[self.resource_name]
      end

    end
    
    attr_accessor :id, :name

    def initialize( attributes={} )
      required, optional = split_required_attributes(attributes, [:id, :name])
      self.id = required[:id]
      self.name = required[:name]
    end

    private

    def split_required_attributes(attributes, required)
      optional_attributes = attributes.symbolize_keys
      required_attributes = {}
      required.each do |key|
        required_attributes[key] = optional_attributes.delete(key) do |missing_key|
          raise ArgumentError.new("Attribute #{missing_key.inspect} is required")
        end
      end
      [required_attributes, optional_attributes]
    end

  end
end
