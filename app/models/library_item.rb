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

class LibraryItem < ActiveRecord::Base

  include PublicActivity::Common

  belongs_to :owner, class_name: "User"
  belongs_to :borrower, class_name: "User"

  belongs_to :book



end
