class FriendsLibraryItemsController < ApplicationController

  before_filter :ensure_logged_in

  def index
    @friends = current_user.friends_with_chestnut 
    @friends_book_ownings = @friends.map { |friend| friend.book_ownerships }.flatten
  end
end