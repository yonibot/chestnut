class DropAlphaFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :alpha
  end
end
