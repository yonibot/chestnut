class BlogPost < ActiveRecord::Base

  before_create :convert_body_to_html

  private

  def convert_body_to_html
    self.body = BlueCloth.new(self.body).to_html
  end


end