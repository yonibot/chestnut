class User < ActiveRecord::Base
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

  has_many :book_ownerships, class_name: "LibraryItem", foreign_key: "owner_id"
  has_many :book_borrowings, class_name: "LibraryItem", foreign_key: "borrower_id"

  has_many :library_items

  def facebook
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
  end

  def friends
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
    @facebook.get_connections("me", "friends")
  end

  def friends_with_chestnut
    @friends_w_c = []
    self.friends.each do |friend|
      if User.where(name: friend["name"]).first
        @friends_w_c.push(User.where(name: friend["name"]).first)
      end
    end
    return @friends_w_c
  end


end