# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string(255)
#  location         :string(255)
#  alpha            :boolean
#  profile_picture  :string(255)
#  registered       :boolean
#  token            :string(255)
#  admin            :boolean
#  blog_follower    :boolean
#

Fabricator(:user) do
  email { Faker::Internet.email }
  name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  location "#{ Faker::Address.city}, #{Faker::Address.country}"
  provider 'facebook'

end
