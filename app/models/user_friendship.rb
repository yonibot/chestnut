class UserFriendship < ActiveRecord::Base


  belongs_to :user
  belongs_to :facebook_friend, class_name: 'User'


end