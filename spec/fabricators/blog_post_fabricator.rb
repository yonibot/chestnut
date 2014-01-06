# == Schema Information
#
# Table name: blog_posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

Fabricator(:blog_post) do

  title { Faker::Company.catch_phrase.titleize }
  body { Faker::Lorem.paragraph(12) }

end
