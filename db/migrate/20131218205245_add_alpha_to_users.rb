class AddAlphaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alpha, :boolean
  end
end
