class LibraryItem < ActiveRecord::Base

  include PublicActivity::Common

  belongs_to :owner, class_name: "User"
  belongs_to :borrower, class_name: "User"

  belongs_to :book



end