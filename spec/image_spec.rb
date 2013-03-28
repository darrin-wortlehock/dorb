require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Image do

  it_should_behave_like 'a resource'

  let(:image_attributes) do
    {
      :id => 429,
      :name => 'Real Backup 10242011',
      :distribution => 'Ubuntu'
    }
  end

  subject { DORB::Image.new image_attributes }

  its(:id) { should == image_attributes[:id] }
  its(:name) { should == image_attributes[:name] }
  its(:distribution) { should == image_attributes[:distribution] }
  
end
