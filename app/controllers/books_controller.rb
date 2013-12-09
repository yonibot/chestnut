class BooksController < ApplicationController

  before_filter :ensure_logged_in

  def index
    @borrowed_books = current_user.book_borrowings
    @owned_books = current_user.book_ownerships
  end

end