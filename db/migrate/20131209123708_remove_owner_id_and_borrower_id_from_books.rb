class RemoveOwnerIdAndBorrowerIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :owner_id
    remove_column :books, :borrower_id
  end
end
