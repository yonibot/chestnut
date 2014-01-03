# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  isbn10     :string(255)
#  isbn13     :string(255)
#  title      :string(255)
#  author     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

Fabricator(:book) do
  isbn10 { Faker::Number.number(10) }
  title { Faker::Company.catch_phrase.titleize }
  author { Faker::Name }
end
