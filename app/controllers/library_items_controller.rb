require 'open-uri'

class LibraryItemsController < ApplicationController

  before_filter :ensure_logged_in

  def index
    @library_owner = User.where(id: params["user_id"]).first
    @borrowed_books = @library_owner.book_borrowings
    @owned_books = @library_owner.book_ownerships
    @books = Book.new
  end

  def destroy
    item = LibraryItem.find(params[:id])
    item.create_activity :destroy, owner: item.owner
    item.destroy
    redirect_to user_library_items_path(current_user)
  end

end
