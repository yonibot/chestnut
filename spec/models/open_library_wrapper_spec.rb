require 'spec_helper'


describe OpenLibraryWrapper do

  let(:isbn10) { 1594480001 }

  describe OpenLibraryWrapper::Book, :vcr do
    describe ".get_author" do
      it "gets the first author from OpenLibrary API using the ISBN10" do
        expect(OpenLibraryWrapper::Book.get_author(isbn10)).to eq("Khaled Hosseini")
      end
    end
    describe ".get_title" do
      it "gets the title from OpenLibrary API using the ISBN10" do
        expect(OpenLibraryWrapper::Book.get_title(isbn10)).to eq("The kite runner")
      end
    end

    describe ".search_open_library" do

      context "with valid query" do

        it "should set @book_results to multi-word query results" do
          book_results = OpenLibraryWrapper::Book.search_open_library("empire falls russo")
          two_books = [[{:book_title=>"Empire Falls"},
            {:book_author=>"Richard Russo"},
            {:book_date=>"2002"},
            {:book_isbn=>"0375726403"}],
            [{:book_title=>"The conquest of Turkey ="},
              {:book_author=>"L. P. Brockett"},
              {:book_date=>"1878"}]]
              expect(book_results).to match_array(two_books)
            end

          end

          context "with invalid query" do

            it "should set @book_results to an empty array" do
              book_results = OpenLibraryWrapper::Book.search_open_library("5a5a5a5a5a")
              no_books = []
              expect(book_results).to match_array(no_books)
            end
          end
        end
      end
    end