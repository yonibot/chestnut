class FriendsLibraryItemsController < ApplicationController

  def index
    @friends = current_user.friends_with_chestnut
  end


end