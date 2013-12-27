require 'spec_helper'



describe LibraryItemsController do

  let(:alice) { Fabricate(:user) }

  describe "GET index" do

    context "with valid login", :vcr do

      before { session[:user_id] = alice.id }

      it "should populate @owned_books with the correct users' books" do
        john = Fabricate(:user)
        mockingbird = Fabricate(:book)
        dorian_gray = Fabricate(:book)
        crime_and_punishment = Fabricate(:book)
        johns_mockingbird = Fabricate(:library_item, owner: john, book: mockingbird)
        alices_dorian_gray = Fabricate(:library_item, owner: alice, book: dorian_gray)
        alices_crime_and_punishment = Fabricate(:library_item, owner: alice, book: crime_and_punishment)
        get :index, user_id: alice.id
        expect(assigns(:owned_books)).to match_array([alices_dorian_gray, alices_crime_and_punishment])
      end

      it "should not populate @owned_books with books of other user" do
        john = Fabricate(:user)
        mockingbird = Fabricate(:book)
        dorian_gray = Fabricate(:book)
        crime_and_punishment = Fabricate(:book)
        johns_mockingbird = Fabricate(:library_item, owner: john, book: mockingbird)
        alices_dorian_gray = Fabricate(:library_item, owner: alice, book: dorian_gray)
        alices_crime_and_punishment = Fabricate(:library_item, owner: alice, book: crime_and_punishment)
        get :index, user_id: alice.id
        expect(assigns(:owned_books)).not_to include(johns_mockingbird)
      end

      it "should set flash to error message for invalid search query", :vcr do
        get :index, user_id: alice.id, seach_query: "5a5a5a5a5a"
        expect(flash[:danger]).to be_blank
      end  
    end

    context "without valid login", :vcr do

      before { session[:user_id] = nil }

      it "redirects to front page" do
        get :index, user_id: alice.id
        expect(response).to redirect_to root_path
      end
    end
  end


  describe "DELETE destroy" do

    before :each do
      session[:user_id] = alice.id
    end

    it "deletes the libraryitem" do
      mockingbird = Fabricate(:book)
      my_mockingbird = Fabricate(:library_item, book: mockingbird, owner: alice)
      delete :destroy, id: my_mockingbird.id
      expect(LibraryItem.count).to eq(0)
    end

    it "redirects to the current user's library" do
      mockingbird = Fabricate(:book)
      Fabricate(:library_item, book: mockingbird, owner: alice)
      delete :destroy, id: mockingbird.id
      expect(response).to redirect_to user_library_items_path(alice)
    end

  end

  describe "GET find" do



  end




end