class CreateLibraryItems < ActiveRecord::Migration
  def change
    create_table :library_items do |t|
      t.integer :owner_id
      t.integer :borrower_id
      t.integer :book_id
    end
  end
end
