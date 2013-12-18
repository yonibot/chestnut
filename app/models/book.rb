require 'open-uri'

class Book < ActiveRecord::Base

  include PublicActivity::Common

  
  has_many :library_items




end
