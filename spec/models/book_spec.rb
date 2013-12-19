require 'spec_helper'


describe Book do
  
  it { should have_many(:library_items)}

end