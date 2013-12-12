OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], scope: 'user_friends, email, user_about_me, user_hometown, user_likes, user_location, friends_about_me, friends_hometown, friends_likes, friends_location, publish_actions, publish_stream, xmpp_login'
end