require 'open-uri'

class BooksController < ApplicationController

  before_filter :ensure_logged_in

  def create
    isbn = params[:book_isbn]
    @book = Book.where(isbn10: isbn).first_or_initialize {|book|
      book.title = params[:book_title]
      book.author = params[:book_author]
      book.isbn10 = params[:book_isbn]
    }
    if @book.save
      library_item = LibraryItem.new(book: @book, owner: current_user)
      if library_item.save
        library_item.create_activity :create, owner: current_user
        flash[:success] = "Your book has been added to your library."
        redirect_to user_library_items_path(current_user)
      end
    else
      flash[:error] = "Please try again."
      render :index
    end
  end


end

