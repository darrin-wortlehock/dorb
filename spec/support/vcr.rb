require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = File.join(File.dirname(__FILE__), '..', 'fixtures', 'cassettes')
  c.hook_into :webmock
  c.filter_sensitive_data('<CLIENT_ID>') { ENV['DIGITAL_OCEAN_CLIENT_ID'] }
  c.filter_sensitive_data('<API_KEY>') { ENV['DIGITAL_OCEAN_API_KEY'] }
end
