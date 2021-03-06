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

class BlogPost < ActiveRecord::Base

  before_create :convert_body_to_html

  validates_presence_of :title, :body

  private

  def convert_body_to_html
    self.body = BlueCloth.new(self.body).to_html
  end


end
