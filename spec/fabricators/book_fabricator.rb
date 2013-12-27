Fabricator(:book) do
  isbn10 { Faker::Number.number(10) }
  title { Faker::Company.catch_phrase.titleize }
  author { Faker::Name }
end