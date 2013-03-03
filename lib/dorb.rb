require 'rest-client'

require 'dorb/core_ext/hash'
require 'dorb/version'
require 'dorb/config'
require 'dorb/region'
require 'dorb/size'

module DORB
  API_ENDPOINT = 'https://api.digitalocean.com'
  APIError = Class.new StandardError
  ConfigurationError = Class.new StandardError
  InvalidStateError = Class.new StandardError
end
