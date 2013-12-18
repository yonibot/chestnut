OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {scope: 'email, user_hometown, friends_hometown, friends_location', client_options: { ssl: { ca_file: '/usr/lib/ssl/certs/ca-certificates.crt'}}}
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


# provider :facebook, 'YOUR_APP_ID', 'YOUR_SECRET_KEY', 
#            {:scope => 'PERMISSION_1, PERMISSION_2, PERMISSION_3...', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}