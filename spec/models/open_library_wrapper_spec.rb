require 'spec_helper'


describe OpenLibraryWrapper do

  let(:isbn10) { 1594480001 }

  describe OpenLibraryWrapper::Book do
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

  end
end