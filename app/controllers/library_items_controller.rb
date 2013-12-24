require 'open-uri'

require 'will_paginate/array'

class LibraryItemsController < ApplicationController

  before_filter :ensure_logged_in

  def index
    if params[:search_query]
      search_query = params[:search_query].split.join('+')
      book_info = JSON.parse(open("https://openlibrary.org/search.json?q=#{search_query}").read)
      @book_results = book_info["docs"].map do |book|
        book_array = []
        book_array.push(book_title: book["title"]) if book["title"]
        book_array.push(book_author: book["author_name"].first) if book["author_name"]
        book_array.push(book_date: book["publish_date"].first) if book["publish_date"]
        book_array.push(book_isbn: book["isbn"].first) if book["isbn"]
        book_array
      end
    end
    if @book_results == []
      flash[:danger] = "Sorry, no books were found. Try entering the ISBN number directly."
    end
    @library_owner = User.where(id: params["user_id"]).first
    @borrowed_books = @library_owner.book_borrowings
    @owned_books = @library_owner.book_ownerships
    # @owned_books = @library_owner.book_ownerships.paginate(:page => params[:page], per_page: 10)
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
