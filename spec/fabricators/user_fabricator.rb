Fabricator(:user) do
  email { Faker::Internet.email }
  password 'foobarbaz'
  name { Faker::Name.first_name Faker::Name.last_name }
  location { Faker::Adress.city, Faker::Adress.country }
  provider 'facebook'
end