class FacebookWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    user.get_fb_friends
    user.add_fb_friends_to_chestnut
    user.get_profile_picture
  end



end