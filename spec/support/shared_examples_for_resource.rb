shared_examples_for "a resource" do

  subject { described_class.new(:id => 1, :name => 'name') }

  it { should respond_to(:id) }
  it { should respond_to(:name) }

  describe '.all' do
    before(:each) do
      DORB::Config.setup :client_id => ENV['DIGITAL_OCEAN_CLIENT_ID'], :api_key => ENV['DIGITAL_OCEAN_API_KEY']
    end
    it "should return an enumerable collection of all the available #{described_class} resources"  do
      VCR.use_cassette "#{described_class}/all" do
        resources = described_class.all
        resources.should_not be_empty
        resources.should respond_to(:each)
        resources.all? { |resource| resource.should be_an_instance_of(described_class) }
      end
    end
  end
  
end
