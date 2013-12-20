require 'open-uri'

class BooksController < ApplicationController

  before_filter :ensure_logged_in

  def create
    isbn = params[:book][:isbn10]
    @book = Book.where(isbn10: params[:book][:isbn10]).first_or_initialize {|book|
      book.title = OpenLibraryWrapper::Book.get_title(isbn)
      book.author = OpenLibraryWrapper::Book.get_author(isbn)
      book.isbn10 = isbn
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

