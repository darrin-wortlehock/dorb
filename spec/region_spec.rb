require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Region do

  subject { DORB::Region.new(:id => 1, :name => 'name') }
  it { should respond_to(:name) }
  it { should respond_to(:id) }

  describe '.all' do
    before(:each) do
      DORB::Config.setup :client_id => ENV['DIGITAL_OCEAN_CLIENT_ID'], :api_key => ENV['DIGITAL_OCEAN_API_KEY']
    end
    it "should return a map of all the available regions" do
      VCR.use_cassette 'regions/all' do
        regions = DORB::Region.all
        regions.should_not be_empty 
        regions.should respond_to(:each)
        regions.all? { |region| region.should be_an_instance_of(DORB::Region) }
      end
    end
  end
end
