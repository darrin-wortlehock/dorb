require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Config do
  describe '.setup' do
    it 'should assign the options hash values to constants in the DORB namespace that correspond to the key values' do
      DORB::Config.setup :client_id => 'YOUR_CLIENT_ID', :api_key => 'YOUR_API_KEY'
      DORB::Config.client_id.should == 'YOUR_CLIENT_ID'
      DORB::Config.api_key.should == 'YOUR_API_KEY'
    end
    
    it 'should allow changes to config after initial setup' do
      DORB::Config.setup :client_id => 'ORIGINAL_CLIENT_ID', :api_key => 'ORIGINAL_API_KEY'
      DORB::Config.setup :client_id => 'UPDATED_CLIENT_ID', :api_key => 'UPDATED_API_KEY'
      DORB::Config.client_id.should == 'UPDATED_CLIENT_ID'
      DORB::Config.api_key.should == 'UPDATED_API_KEY'
    end
  end
  describe '.client_id' do
    it 'should raise an exception when invoked before set' do
      expect {
        DORB::Config.client_id
      }.to raise_error(DORB::ConfigurationError, \
        "Cannot complete request. Please set client_id with DORB::Config.setup first!")
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
