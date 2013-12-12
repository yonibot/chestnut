class FriendsLibraryItemsController < ApplicationController

  def index
    @friends = current_user.friends_with_chestnut
    @friends_book_ownings = @friends.map{ |friend| friend.book_ownerships}.first
  end
end