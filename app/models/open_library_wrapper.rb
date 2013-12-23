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

  end
end
