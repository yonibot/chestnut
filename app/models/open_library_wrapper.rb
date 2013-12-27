require 'open-uri'

module OpenLibraryWrapper
  class Book

    def self.get_info(isbn)
      JSON.parse(open("https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data").read)
    end

    def self.get_author(isbn)
      self.get_info(isbn)["ISBN:#{isbn}"]["authors"][0]["name"]
    end

    def self.get_title(isbn)
      self.get_info(isbn)["ISBN:#{isbn}"]["title"]
    end

    def self.search_open_library(search_query)
      search_term = search_query.split.join('+')
      book_info = JSON.parse(open("https://openlibrary.org/search.json?q=#{search_term}").read)
      @book_results = book_info["docs"].map do |book|
        book_array = []
        book_array.push(book_title: book["title"]) if book["title"]
        book_array.push(book_author: book["author_name"].first) if book["author_name"]
        book_array.push(book_date: book["publish_date"].first) if book["publish_date"]
        book_array.push(book_isbn: book["isbn"].first) if book["isbn"]
        book_array
      end
    end

  end
end
