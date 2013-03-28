require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Droplet do

  it_should_behave_like 'a resource'

  let(:droplet_attributes) do
    {
      :id => 100823,
      :name => 'test222',
      :backups_active => false,
      :image_id => 420,
      :region_id => 1,
      :size_id => 33,
      :status => 'active'
    }
  end

  subject { DORB::Droplet.new droplet_attributes }

  its(:id) { should == droplet_attributes[:id] }
  its(:name) { should == droplet_attributes[:name] }
  its(:backups_active) { should == droplet_attributes[:backups_active] }
  its(:image_id) { should == droplet_attributes[:image_id] }
  its(:region_id) { should == droplet_attributes[:region_id] }
  its(:size_id) { should == droplet_attributes[:size_id] }
  its(:status) { should == droplet_attributes[:status] }


end
