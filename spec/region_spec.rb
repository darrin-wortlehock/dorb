require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Region do

  subject { DORB::Region.new(:id => 1, :name => 'name') }
  it { should respond_to(:name) }
  it { should respond_to(:id) }
  it { should respond_to(:to_sym) }

  describe '.all' do
    it "should return a map of all the available regions" do
      regions = DORB::Region.all
      regions.should_not be_empty 
      regions.should respond_to(:keys)
      regions.keys.all? { |key| key.should be_an_instance_of(Symbol) }
      regions.should respond_to(:values)
      regions.values.all? { |value| value.should be_an_instance_of(DORB::Region) }
      regions.should respond_to(:each)
    end
  end
end
