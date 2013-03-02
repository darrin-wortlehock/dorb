require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Config do
  describe '.setup' do
    it 'should assign the options hash values to constants in the DORB namespace that correspond to the key values' do
      DORB::Config.setup :client_key => 'YOUR_CLIENT_KEY', :api_key => 'YOUR_API_KEY'
      DORB::Config.client_key.should == 'YOUR_CLIENT_KEY'
      DORB::Config.api_key.should == 'YOUR_API_KEY'
    end
    
    it 'should allow changes to config after initial setup' do
      DORB::Config.setup :client_key => 'ORIGINAL_CLIENT_KEY', :api_key => 'ORIGINAL_API_KEY'
      DORB::Config.setup :client_key => 'UPDATED_CLIENT_KEY', :api_key => 'UPDATED_API_KEY'
      DORB::Config.client_key.should == 'UPDATED_CLIENT_KEY'
      DORB::Config.api_key.should == 'UPDATED_API_KEY'
    end
  end
  describe '.client_key' do
    it 'should raise an exception when invoked before set' do
      expect {
        DORB::Config.client_key
      }.to raise_error(DORB::ConfigurationError, \
        "Cannot complete request. Please set client_key with DORB::Config.setup first!")
    end
  end
  describe '.api_key' do
    it 'should raise an exception when invoked before set' do
      expect {
        DORB::Config.api_key
      }.to raise_error(DORB::ConfigurationError, \
        "Cannot complete request. Please set api_key with DORB::Config.setup first!")
    end
  end
end
