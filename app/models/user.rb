# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string(255)
#  location         :string(255)
#  alpha            :boolean
#  profile_picture  :string(255)
#  registered       :boolean
#

class User < ActiveRecord::Base

  include PublicActivity::Common

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = auth.info.email
      user.location = auth.info.location
      user.registered = true
      user.save!
    end
  end


  has_many :book_ownerships, class_name: "LibraryItem", foreign_key: "owner_id"
  has_many :book_borrowings, class_name: "LibraryItem", foreign_key: "borrower_id"

  has_many :user_friendships
  has_many :facebook_friends, through: :user_friendships

  def facebook
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
  end

  def get_fb_friends
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
    @fb_friends = @facebook.get_connections("me", "friends")
  end

  def add_fb_friends_to_chestnut
    @fb_friends.each do |friend|
      # if friend is in the db && user and 'friend' are not fb friends in the database
      if User.where(name: friend["name"]).first && !self.facebook_friends.where(name: friend["name"]).first
        # add their friendship to the database
        new_friendship = UserFriendship.new(user: self, facebook_friend: User.where(name: friend["name"]).first)
        new_friendship.save
      # elsif friend is not in the db
      elsif !User.where(name: friend["name"]).first
        # add friend to the db
        new_user = User.new(name: friend["name"], uid: friend["id"], registered: false)
        new_user.save
        # add friendship link
        new_friendship = UserFriendship.new(user: self, facebook_friend: new_user)
        new_friendship.save
      end
    end
  end

  def get_profile_picture
    self.profile_picture = @facebook.get_picture(self.uid, {type: 'square'})
    self.save
  end

  def friends_with_chestnut
    self.facebook_friends.where(registered: true)
  end

end
