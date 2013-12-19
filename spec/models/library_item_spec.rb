require 'spec_helper'


describe LibraryItem do

  it { should belong_to(:owner).class_name('User')}
  it { should belong_to(:borrower).class_name('User')}
  it { should belong_to(:book)}

end