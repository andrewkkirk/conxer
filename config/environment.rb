# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Conxer::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => "andrewkkirk",
  :password => "7XqW5^hY",
  :domain => "andrewkkirk.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}