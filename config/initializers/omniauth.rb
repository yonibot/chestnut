OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], scope: 'email, user_hometown, friends_hometown, friends_location'
end


# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   if Rails.env.development?
#     OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
#     provider :facebook, 'DEV_APP_ID', 'DEV_APP_SEVRET'
#   else
#     provider :facebook, 'DEPLOY_APP_ID', 'DEPLOY_APP_SECRET'
#   end
# end