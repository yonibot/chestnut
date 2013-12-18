OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], scope: 'email, user_hometown, friends_hometown, friends_location', client_options: { ssl: { ca_file: '/usr/lib/ssl/certs/ca-certificates.crt'}}
end
