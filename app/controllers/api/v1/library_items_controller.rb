module Api
  module V1
    class LibraryItemsController < ApplicationController
      respond_to :json
      
      def index
        # returns owned_books of user_id
        @library_owner = User.where(id: params[:user_id]).first
        @owned_books = @library_owner.book_ownerships
        respond_with @owned_books.map { |lib_item| lib_item.book }
      end

    end
  end
end

