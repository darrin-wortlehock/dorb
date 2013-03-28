require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Size do

  it_should_behave_like 'a resource'

  let(:size_attributes) do
    {
      :id => 35,
      :name => '2GB',
      :memory => 2048,
      :disk => 40,
      :cpu => 2,
      :cost_per_hour => 0.02976
    }
  end

  subject { DORB::Size.new size_attributes }

  its(:id) { should == size_attributes[:id] }
  its(:name) { should == size_attributes[:name] }

  its(:memory) { should == size_attributes[:memory] }
  its(:disk) { should == size_attributes[:disk] }
  its(:cpu) { should == size_attributes[:cpu] }
  its(:cost_per_hour) { should == size_attributes[:cost_per_hour] }

end
