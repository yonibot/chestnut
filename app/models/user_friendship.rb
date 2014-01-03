# == Schema Information
#
# Table name: user_friendships
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  facebook_friend_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class UserFriendship < ActiveRecord::Base


  belongs_to :user
  belongs_to :facebook_friend, class_name: 'User'


end
