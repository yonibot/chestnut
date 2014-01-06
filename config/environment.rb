# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Chestnut2::Application.initialize!

# Recognize Haml in Actionmailer
ActionMailer::Base.register_template_extension('haml')
