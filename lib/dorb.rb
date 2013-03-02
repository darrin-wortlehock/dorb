require 'rest-client'
require 'dorb/version'
require 'dorb/config'

module DORB
  API_ENDPOINT = 'https://api.digitalocean.com'
  APIError = Class.new StandardError
  ConfigurationError = Class.new StandardError
  InvalidStateError = Class.new StandardError
end
