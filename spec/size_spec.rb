require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe DORB::Size do

  it_should_behave_like 'a resource'

  subject { DORB::Size.new(:id => 1, 
                           :name => '2GB', 
                           :memory => 2048, 
                           :disk => 40, 
                           :cpu => 2, 
                           :cost_per_hour => 0.02976) }

  it { should respond_to(:memory) }
  it { should respond_to(:disk) }
  it { should respond_to(:cpu) }
  it { should respond_to(:cost_per_hour) }

end
