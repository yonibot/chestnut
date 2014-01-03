# == Schema Information
#
# Table name: library_items
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  borrower_id :integer
#  book_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

Fabricator(:library_item) do


end
