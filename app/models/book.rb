class Book < ActiveRecord::Base

  has_many :library_items

end