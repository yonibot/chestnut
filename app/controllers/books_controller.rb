require 'open-uri'

class BooksController < ApplicationController

  before_filter :ensure_logged_in

  def index
    @borrowed_books = current_user.book_borrowings
    @owned_books = current_user.book_ownerships
    @name = current_user[:name]
    @books = Book.new
  end

  def create
    book_info = JSON.parse(open("https://openlibrary.org/api/books?bibkeys=ISBN:#{params[:book][:isbn10]}&format=json&jscmd=data").read)
    book_author = book_info["ISBN:#{params[:book][:isbn10]}"]["authors"][0]["name"]
    book_title = book_info["ISBN:#{params[:book][:isbn10]}"]["title"]
    book_publish_date = book_info["ISBN:#{params[:book][:isbn10]}"]["publish_date"]
    @book = Book.where(isbn10: params[:book][:isbn10]).first_or_initialize {|book|
      book.title = book_title
      book.author = book_author
      book.isbn10 = params[:book][:isbn10] }
    if @book.save
      library_item = LibraryItem.create(book: @book, owner: current_user)
      flash[:success] = "Your book has been added to your library."
      redirect_to books_path
    else
      flash[:error] = "Please try again."
      render :index
    end
  end

  def destroy
    item = LibraryItem.find(params[:id])
    item.destroy
    redirect_to books_path
  end

end

