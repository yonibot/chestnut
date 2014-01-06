class ChestnutMailer < ActionMailer::Base

  def send_blog_update(user)
    @user = user
    mail from: 'Admin <yoni@yoniweisbrod.com>', to: user.email, subject: "New blog post on Chestnut!"
  end


end