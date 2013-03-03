require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Size do

  subject { DORB::Size.new(:id => 1, 
                           :name => '2GB', 
                           :memory => 2048, 
                           :disk => 40, 
                           :cpu => 2, 
                           :cost_per_hour => 0.02976) }

  it { should respond_to(:name) }
  it { should respond_to(:id) }
  it { should respond_to(:memory) }
  it { should respond_to(:disk) }
  it { should respond_to(:cpu) }
  it { should respond_to(:cost_per_hour) }
  it { should respond_to(:to_sym) }

  describe '.all' do
    before(:each) do
      DORB::Config.setup :client_id => ENV['DIGITAL_OCEAN_CLIENT_ID'], :api_key => ENV['DIGITAL_OCEAN_API_KEY']
    end
    it "should return a map of all the available sizes" do
      VCR.use_cassette 'sizes/all' do
        sizes = DORB::Size.all
        sizes.should_not be_empty
        sizes.should respond_to(:keys)
        sizes.keys.all? { |key| key.should be_an_instance_of(Symbol) }
        sizes.should respond_to(:values)
        sizes.values.all? { |value| value.should be_an_instance_of(DORB::Size) }
        sizes.should respond_to(:each)
      end
    end
  end

end