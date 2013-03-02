require 'rubygems'
require 'bundler/setup'
require 'dorb'

RSpec.configure do |config|
  config.after(:each) do
    DORB::Config.client_key = nil
    DORB::Config.api_key = nil
  end
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
