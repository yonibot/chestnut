class AddTimestampsToLibraryItems < ActiveRecord::Migration
  def change
    add_timestamps :library_items
  end
end
