Fabricator(:user) do
  email { Faker::Internet.email }
  name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  location "#{ Faker::Address.city}, #{Faker::Address.country}"
  provider 'facebook'
end