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
      user.save!
    end
  end

  serialize :fb_friends

  has_many :book_ownerships, class_name: "LibraryItem", foreign_key: "owner_id"
  has_many :book_borrowings, class_name: "LibraryItem", foreign_key: "borrower_id"

  has_many :library_items

  def facebook
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
  end

  def get_fb_friends
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
    self.fb_friends = @facebook.get_connections("me", "friends")
    self.save
  end

  def friends_with_chestnut
    @friends_w_c = []
    self.fb_friends.each do |friend|
      if User.where(name: friend["name"]).first
        @friends_w_c.push(User.where(name: friend["name"]).first)
      end
    end
    return @friends_w_c
  end


end