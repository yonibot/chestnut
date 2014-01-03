# == Schema Information
#
# Table name: library_items
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  borrower_id :integer
#  book_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'


describe LibraryItem do

  it { should belong_to(:owner).class_name('User')}
  it { should belong_to(:borrower).class_name('User')}
  it { should belong_to(:book)}

end
