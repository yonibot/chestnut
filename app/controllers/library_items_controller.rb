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

  def find
    friends = current_user.friends_with_chestnut 
    @users_friends_books_for_select = friends.map { |friend| friend.book_ownerships.map { |lib_item| lib_item.book } }.flatten.uniq
    @users_friends_book_titles_for_select = @users_friends_books_for_select.map { |book| book.title }
    @users_friends_book_ids_for_select = @users_friends_books_for_select.map { |book| book.id }
    @library_item_results = current_user.friends_with_chestnut.map { |friend| friend.book_ownerships }.flatten.map{ |lib_item| lib_item if lib_item.book_id == params[:search].to_i }.compact
  end


end