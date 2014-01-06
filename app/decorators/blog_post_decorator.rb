class BlogPostDecorator < Draper::Decorator
  delegate_all

  def to_markdown
    BlueCloth.new(object.text).to_html
  end

end
